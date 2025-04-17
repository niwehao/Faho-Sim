import argparse
import os
from typing import List, Set, Union
from data_prep.bs_data_prep import BSDataPrep
from data_prep.gemv_data_prep import GEMVDataPrep
from data_prep.hst_data_prep import HSTDataPrep
from data_prep.mlp_data_prep import MLPDataPrep
from data_prep.red_data_prep import REDDataPrep
from data_prep.scan_rss_data_prep import SCANRSSDataPrep
from data_prep.scan_ssa_data_prep import SCANSSADataPrep
from data_prep.sel_data_prep import SELDataPrep
from data_prep.trns_data_prep import TRNSDataPrep
from data_prep.ts_data_prep import TSDataPrep
from data_prep.uni_data_prep import UNIDataPrep
from data_prep.va_data_prep import VADataPrep
from data_prep.test1_data_prep import TEST1DataPrep
from executable import Executable
class Assembler:
    DataPrep = Union[
        BSDataPrep,
        GEMVDataPrep,
        HSTDataPrep,
        MLPDataPrep,
        REDDataPrep,
        SCANRSSDataPrep,
        SCANSSADataPrep,
        SELDataPrep,
        TRNSDataPrep,
        TSDataPrep,
        UNIDataPrep,
        VADataPrep,
        TEST1DataPrep,
    ]

    def __init__(self):
        pass
def assemble(
        executable: Executable, linker_script: LinkerScript, data_prep_param: List[int], num_dpus: int
) -> None:
    #把executable.sections内容存到t.txt

    Assembler._assemble_atomic(executable, num_dpus)
    Assembler._assemble_iram(executable, num_dpus)
    Assembler._assemble_wram(executable, num_dpus)
    Assembler._assemble_mram(executable, num_dpus)

    Assembler._assemble_global_object_symbols(executable, num_dpus)
    Assembler._assemble_labels(executable, num_dpus)

    Assembler._assemble_dpu_transfer_pointer(executable, linker_script, num_dpus)

    benchmark = Assembler._benchmark(executable)
    num_tasklets = Assembler._num_tasklets(executable)
    data_prep = Assembler.data_prep(benchmark, num_tasklets, data_prep_param, num_dpus)

    Assembler._assemble_input_dpu_mram_heap_pointer_name(executable, data_prep)#
    Assembler._assemble_output_dpu_mram_heap_pointer_name(executable, data_prep)
    Assembler._assemble_dpu_input_arguments(executable, data_prep)
    Assembler._assemble_dpu_results(executable, data_prep)
    Assembler._assemble_num_executions(executable, data_prep)
if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--benchmark", type=str, default="SEL")
    parser.add_argument("--num_tasklets", type=int, default=1)
    parser.add_argument("--mode", type=str, default="all")
    parser.add_argument("--data_prep_param", type=str, default="2048")
    parser.add_argument("--num_dpus", type=int, default="16")
    args = parser.parse_args()

    data_prep_param = [int(elem) for elem in args.data_prep_param.split(',')]