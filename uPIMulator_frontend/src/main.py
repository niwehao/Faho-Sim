import argparse
import os

from compiler.compiler import Compiler
from linker_.linker import Linker
from util.path_collector import PathCollector

import os
import subprocess
def compile_library(lib,num_tasklets) -> None:
    path=os.path.join(PathCollector.sdk_path_in_local(),lib )
    asm_path=os.path.join(PathCollector.asm_path_in_local(), lib)
    #删除asm_path下的所有文件,不包括文件夹
    cmd=["rm", "-rf", asm_path]
    subprocess.run(cmd, check=True)
    cmd=['mkdir', '-p', asm_path]
    subprocess.run(cmd, check=True)
    #打开文件夹asm_path
    os.chdir(path)
    #遍历path下的所有的.c文件
    c_files = [f for f in os.listdir(path) if f.endswith('.c')]
    for c_file in c_files:
        asm_file = os.path.join(asm_path, c_file.replace(".c", ".S"))
        #编译命令
        complie = ["dpu-upmem-dpurte-clang","-S","-g0","-w","-O3",f"-DNR_TASKLETS={num_tasklets}",  "-o", c_file.replace(".c", ".S"),c_file]
        #把结果移到asm_file
        move=["mv", c_file.replace(".c", ".S"), asm_file]
        #执行编译命令
        cmds= [complie, move]
        for cmd in cmds:    
            subprocess.run(cmd, check=True)

    pass
def compile_sdk(num_tasklets: int) -> None:
    for lib in ["misc", "stdlib", "syslib"]:
        compile_library(lib,num_tasklets)
def compile_by_toolchain(benchmark: str, num_tasklets: int) -> None:#简单编译
    path=os.path.join(PathCollector.benchmark_path_in_local(), benchmark)#kernel文件夹
    asm_dir = os.path.join(PathCollector.asm_path_in_local(), f"{benchmark}.{num_tasklets}")


    asm_path = os.path.join(asm_dir, "main.S")
    current_dir = os.getcwd()
    os.chdir(path)
    try:
        make_clean = ["make", "clean"]
        make = ["make", f"NR_TASKLETS={num_tasklets}"]
        mkdir = ["mkdir", "-p", asm_dir]
        mv = ["mv", "dpu_code.S", asm_path]
        commands = [make_clean, make, mkdir, mv]
    
        for cmd in commands:
            subprocess.run(cmd, check=True)
        #打开文件asm_path,把文件里的.data字符串全部替换.section	.data,"aw",@progbits
        if benchmark == "KERNEL":
            # 读取lib.S文件内容
            lib_path = os.path.join(path, "lib.S")
            with open(lib_path, 'r') as file:
                lib_data = file.read()
            
            # 读取目标asm文件
            with open(asm_path, 'r') as file:
                asm_lines = file.readlines()
            
            # 将lib.S的内容按行分割
            lib_lines = lib_data.splitlines(keepends=True)
            
            insert_position = 2  #line of start (first index is 0)
            
            # 确保插入位置不超过文件长度
            if insert_position > len(asm_lines):
                insert_position = len(asm_lines)
            
            # 插入内容
            result_lines = (asm_lines[:insert_position] + 
                        lib_lines + 
                        asm_lines[insert_position:])
            
            # 写回文件
            with open(asm_path, 'w') as file:
                file.writelines(result_lines)
            with open(asm_path, 'r') as file:
                data = file.read()
                data = data.replace('.data', '.section	.data,"aw",@progbits')
                data = data.replace('mram_write', '_mram_write')
                data = data.replace('mram_read', '_mram_read')
            with open(asm_path, 'w') as file:
                file.write(data)

        print("compile success")
    finally:
    # 完成后返回原来的目录
        os.chdir(current_dir)
   
def compile(benchmark: str, num_tasklets: int) -> None:#简单编译
    Compiler.clean()
    Compiler.compile_sdk(num_tasklets)
    Compiler.compile_benchmark(benchmark, num_tasklets)

def link(benchmark: str, num_dpus: int,num_tasklets: int, data_prep_param: list) -> None:#链接方式是O2优化
    #如果存在文件save_lib.pkl,则加载类
    if os.path.exists( "save_lib.pkl"):
        linker=Linker.load_state("save_lib.pkl")
    else:
        linker = Linker(num_tasklets,benchmark)
    linker.link(os.path.join(PathCollector.asm_path_in_local(), f"{benchmark}.{num_tasklets}", "main.S"), data_prep_param, num_dpus,benchmark)#在这里对main.S进行链接






if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--benchmark", type=str, default="SEL")
    parser.add_argument("--num_tasklets", type=int, default=1)
    parser.add_argument("--mode", type=str, default="all")
    parser.add_argument("--data_prep_param", type=str, default="2048")
    parser.add_argument("--num_dpus", type=int, default="16")
    args = parser.parse_args()

    data_prep_param = [int(elem) for elem in args.data_prep_param.split(',')]
    if args.mode == "compile":
        compile(args.benchmark, args.num_tasklets)

    elif args.mode == "link":
        link(args.benchmark, args.num_dpus, args.num_tasklets, data_prep_param)

    elif args.mode == "compile_by_toolchain":
        #compile_sdk(args.num_tasklets)
        compile_by_toolchain(args.benchmark, args.num_tasklets)
        link(args.benchmark, args.num_dpus, args.num_tasklets, data_prep_param)
    else:
        raise ValueError
