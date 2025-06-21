import os
from typing import List, Set, Union

import antlr4
from typing import Optional

from abi.binary.executable import Executable
from abi.binary.relocatable import Relocatable
from assembler.assembler import Assembler
from linker_.linker_script import LinkerScript
from linker_.logic.instruction_assigner import InstructionAssigner
from linker_.logic.label_assigner import LabelAssigner
from linker_.logic.liveness_analyzer import LivenessAnalyzer
from linker_.logic.set_assigner import SetAssigner
from parser_.parser import Parser
from util.path_collector import PathCollector
import pickle
from abi.section.section_name import SectionName
from util.config_loader import ConfigLoader

class Linker:
    def __init__(self, num_tasklets: int,benchmark: str):
        self.benchmark = benchmark
        self._libs: List[Relocatable] = self._init_libs()
        self.save_state("save_lib.pkl")
    @classmethod
    def load_state(cls, filename):
        """从文件加载对象状态"""
        with open(filename, 'rb') as f:
            return pickle.load(f)
    def save_state(self, filename):
        """保存对象状态到文件"""
        with open(filename, 'wb') as f:
            pickle.dump(self, f)
            print(f"状态已保存到 {filename}")
    def find_pointer(self,executable: Executable, benchmark: str,num_dpus:int,linker_script: LinkerScript) -> None:#收集指针的值
        sectio_pointer = executable.section(SectionName.TEXT, "main")
        pointer=[0]*2
        #遍历section中的label
        for label in sectio_pointer.labels():#相对位置
            if label.name() == "main":
                pointer[0] = label.address()
        addr= linker_script.symbol("__sys_stack_thread_0").address()
        pointer[1] = addr - ConfigLoader.wram_offset()#直接获得绝对位置

        assert pointer[0] != 0
        assert pointer[1] != 0
   
        filepath = os.path.join(PathCollector.bin_path_in_local(), f"{num_dpus}_dpus", *executable.filepath().split(os.path.sep)[-2:-1],"pointer.bin")
        #把值一行一行写入文件
        with open(filepath, "w") as file:
            file.write(f"{pointer[0]}\n")
            file.write(f"{pointer[1]}\n")


    def find_pointer_kernel(self,executable: Executable, benchmark: str,num_dpus:int) -> None:#收集指针的值
        sectio_pointer = executable.section(SectionName.DPU_HOST, "")
        pointer=[0]*5;
        #遍历section中的label
        for label in sectio_pointer.labels():#相对位置
            if label.name() == "dpu_id":
                pointer[0] = label.address()-ConfigLoader.wram_offset()#相对位置
            elif label.name() == "processs":
                pointer[1] = label.address()-ConfigLoader.wram_offset()
                print('process位置:'+str(label.address()))
            elif label.name() == "inode_table":
                pointer[2] = label.address()-ConfigLoader.wram_offset()
            
        

        sectio_pointer = executable.section(SectionName.TEXT, "jmp_mram")
        for label in sectio_pointer.labels():#相对位置
            if label.name() == "jmp_mram":
                pointer[3] = label.address()-ConfigLoader.iram_kernel_offset()-ConfigLoader.iram_offset()
        sectio_pointer = executable.sections(SectionName.DATA)
        for section in sectio_pointer:
            for label in section.labels():
                if label.name() == "jobs":
                    pointer[4] = label.address()-ConfigLoader.wram_offset()
        #assert pointer的值都不为0
        assert pointer[0] != 0
        assert pointer[1] != 0
        assert pointer[2] != 0
        assert pointer[3] != 0
        assert pointer[4] != 0
        filepath = os.path.join(PathCollector.bin_path_in_local(), f"{num_dpus}_dpus", *executable.filepath().split(os.path.sep)[-2:-1],"pointer.bin")
        #把值一行一行写入文件
        with open(filepath, "w") as file:
            file.write(f"{pointer[0]}\n")
            file.write(f"{pointer[1]}\n")
            file.write(f"{pointer[2]}\n")
            file.write(f"{pointer[3]}\n")
            file.write(f"{pointer[4]}\n")
    def link(self, filepath: str, data_prep_param: list, num_dpus: int, benchmark: str) -> None:
        num_tasklets = Linker._num_tasklets(filepath)
        linker_script = LinkerScript(num_tasklets)

        relocatable = Relocatable(filepath)
        self._analyze_liveness(relocatable)
        relocatables = self._resolve_symbols(relocatable, linker_script)

        executable = Executable(filepath, relocatables)
        Linker._write_bin(executable, num_dpus)

        self._analyze_liveness(executable)
        self._assign_labels(executable)
        linker_script.assign_address(executable,benchmark)#分配地址
        if benchmark == "KERNEL":
            self.find_pointer_kernel(executable, benchmark,num_dpus)
        if benchmark != "KERNEL":
            self.find_pointer(executable, benchmark,num_dpus,linker_script)
        self._assign_set(executable)
        self._assign_instruction(executable, linker_script)


        Assembler.assemble(executable, linker_script, data_prep_param, num_dpus,benchmark)
       

    def _analyze_liveness(self, binary: Union[Relocatable, Executable]):
        document = Parser.parse_lines(binary.lines())
        liveness_analyzer = LivenessAnalyzer(binary)
        parse_tree_walker = antlr4.ParseTreeWalker()
        parse_tree_walker.walk(liveness_analyzer, document)

    def _resolve_symbols(self, relocatable: Relocatable, linker_script: LinkerScript) -> Set[Relocatable]:
        relocatables: Set[Relocatable] = {relocatable, self._crt0_relocatable()}
        #把所有没有找到的符号和之前解析的库进行总体的一个链接

        unresolved_symbols = self._unresolved_symbols(relocatables, linker_script)
        while unresolved_symbols:
            has_resolved = False
            for unresolved_symbol in unresolved_symbols:
                for lib in self._libs:
                    if unresolved_symbol in lib.liveness().defs():#实际上要看全局地址
                        relocatables.add(lib)
                        #TODO 只获取
                        has_resolved = True
            if(has_resolved==False):
                a=a+1 #capture
            

            unresolved_symbols = self._unresolved_symbols(relocatables, linker_script)#反复遍历直到没有多余变量

        return relocatables

    def _defs(self, relocatables: Set[Relocatable]) -> Set[str]:
        defs: Set[str] = set()
        for relocatable in relocatables:
            defs.update(relocatable.liveness().defs())
        return defs

    #main.s

    def _unresolved_symbols(self, relocatables: Set[Relocatable], linker_script: LinkerScript) -> Set[str]:
        defs = self._defs(relocatables)
        unresolved_symbols: Set[str] = set()
        for relocatable in relocatables:
            for unresolved_symbol in relocatable.liveness().unresolved_symbols():
                if (
                    unresolved_symbol not in defs
                    and unresolved_symbol not in linker_script.symbol_names()
                    and unresolved_symbol not in linker_script.constant_names()
                ):
                    unresolved_symbols.add(unresolved_symbol)
        return unresolved_symbols

    def _assign_labels(self, executable: Executable) -> None:
        # 为标签计算大小
        document = Parser.parse_lines(executable.lines())
        label_assigner = LabelAssigner(executable)
        parse_tree_walker = antlr4.ParseTreeWalker()
        parse_tree_walker.walk(label_assigner, document)

    def _assign_set(self, executable: Executable) -> None:
        document = Parser.parse_lines(executable.lines())
        set_assigner = SetAssigner(executable)
        parse_tree_walker = antlr4.ParseTreeWalker()
        parse_tree_walker.walk(set_assigner, document)

    def _assign_instruction(self, executable: Executable, linker_script: LinkerScript) -> None:
        document = Parser.parse_lines(executable.lines())
        instruction_assigner = InstructionAssigner(executable, linker_script)
        parse_tree_walker = antlr4.ParseTreeWalker()
        parse_tree_walker.walk(instruction_assigner, document)

    def _init_libs(self) -> List[Relocatable]:
        relocatables: List[Relocatable] = []
        libS=[]
        if self.benchmark == "KERNEL":
            libS=Linker.libs_names(1)
        for lib_name in libS:
            asm_lib_path = os.path.join(PathCollector.asm_path_in_local(), lib_name)
            for root_path, _, filenames in os.walk(asm_lib_path):
                for filename in filenames:
                    if filename.split(".")[-1] == "S":
                        filepath = os.path.join(root_path, filename)
                        relocatable = Relocatable(filepath)
                        self._analyze_liveness(relocatable)
                        relocatables.append(relocatable)
        return relocatables
    def _crt0_relocatable(self) -> Relocatable:
        for lib in self._libs:
            crt0_filepath = os.path.join(PathCollector.asm_path_in_local(), "misc", "crt0.S")
            if lib.filepath() == crt0_filepath:
                return lib
        raise ValueError

    @staticmethod
    def _write_bin(executable: Executable, num_dpus: int) -> None:
        filepath = os.path.join(PathCollector.bin_path_in_local(), f"{num_dpus}_dpus", *executable.filepath().split(os.path.sep)[-2:])

        dirname = os.path.dirname(filepath)
        if not os.path.exists(dirname):
            os.makedirs(dirname)

        with open(filepath, "w") as file:
            file.writelines(executable.lines())

    @staticmethod
    def _num_tasklets(filepath: str) -> int:
        return int(filepath.split(os.path.sep)[-2].split(".")[-1])

    @staticmethod
    def libs_names(flag: Optional[int] = None) -> List[str]:
        if flag is not None:
            lib = ["misc", "stdlib", "syslib"]
            return lib
        else:
            lib = ["misc", "stdlib", "syslib"]
        return lib
