import argparse
import os

from compiler.compiler import Compiler
from linker_.linker import Linker
from util.path_collector import PathCollector

import os
import subprocess
def compile(benchmark: str, num_tasklets: int) -> None:#简单编译
    path=os.path.join(PathCollector.benchmark_path_in_local(), benchmark)
    asm_dir = os.path.join(PathCollector.asm_path_in_local(), f"{benchmark}.{num_tasklets}")
    asm_path = os.path.join(asm_dir, "main.S")

    # 确保目标目录存在
    os.makedirs(asm_dir, exist_ok=True)
    # 切换到指定路径
    current_dir = os.getcwd()
    os.chdir(path)
    try:
        cmd = [
            "dpu-upmem-dpurte-clang",
            "-O3",
            "-S",
            f"-DNR_TASKLETS={num_tasklets}",
            "-g",
            "-o",
            f"{asm_path}",
            "dpu/task.c"
        ]

        subprocess.run(cmd, check=True)
        print("compile success")
    finally:
    # 完成后返回原来的目录
        os.chdir(current_dir)
    #Compiler.clean()
    #Compiler.compile_sdk(num_tasklets)
    #Compiler.compile_benchmark(benchmark, num_tasklets)


def link(benchmark: str, num_dpus: int,num_tasklets: int, data_prep_param: list) -> None:#链接方式是O2优化
    linker = Linker(num_tasklets)
    linker.link(os.path.join(PathCollector.asm_path_in_local(), f"{benchmark}.{num_tasklets}", "main.S"), data_prep_param, num_dpus)#在这里对main.S进行链接






if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--benchmark", type=str, default="SEL")
    parser.add_argument("--num_tasklets", type=int, default=1)
    parser.add_argument("--mode", type=str, default="all")
    parser.add_argument("--data_prep_param", type=str, default="2048")
    parser.add_argument("--num_dpus", type=int, default="16")
    args = parser.parse_args()

    data_prep_param = [int(elem) for elem in args.data_prep_param.split(',')]
    if args.mode == "simple":
        compile(args.benchmark, args.num_tasklets)
        link(args.benchmark, args.num_dpus, args.num_tasklets, data_prep_param)

    if args.mode == "link":
        #compile(args.benchmark, args.num_tasklets)
        link(args.benchmark, args.num_dpus, args.num_tasklets, data_prep_param)
        print("link success")
    else:
        raise ValueError
