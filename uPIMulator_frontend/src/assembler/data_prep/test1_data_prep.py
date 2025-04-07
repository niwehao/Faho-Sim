from typing import List, Optional

import numpy as np

from abi.word.immediate import Immediate
from abi.word.representation import Representation
from assembler.data_prep.bin import Bin
from encoder.byte import Byte
from initializer.int_initializer import IntInitializer
from util.config_loader import ConfigLoader


class TEST1DataPrep:
    def __init__(self, num_tasklets: int, data_prep_param: List[int], num_dpus: int):#data_prep_param 是输入参数
        assert 0 < num_tasklets < ConfigLoader.max_num_tasklets()#结果的储存取决于结果的储存方式,所以input和output大小需要对称

        self._num_tasklets: int = num_tasklets
        self._num_dpus: int = num_dpus
        self._buffer_size: int = data_prep_param[0]  # 1048576

        self._num_executions: int = 1

        elem_size = 4

        self._is_strong_scaling = True  # True --> strong scaling / False --> weak scaling
        input_size = self._buffer_size if self._is_strong_scaling else self._buffer_size * self._num_dpus

        if (input_size * elem_size) % 8 != 0:
            input_size_8bytes = (input_size // 8) * 8 + 8
        else:
            input_size_8bytes = input_size

        input_size_dpu = ((input_size) - 1) // (self._num_dpus) + 1

        if (input_size_dpu * elem_size) % 8 != 0:
            self._input_size_dpu_8bytes = (input_size_dpu // 8) * 8 + 8
        else:
            self._input_size_dpu_8bytes = input_size_dpu

        self.a=1

        self._size: List[int] = [self._input_size_dpu_8bytes * elem_size for _ in range(self._num_dpus - 1)]
        self._size.append((input_size_8bytes - (self._input_size_dpu_8bytes * (self._num_dpus - 1))) * elem_size)

        self._transfer_size: List[int] = [self._input_size_dpu_8bytes * elem_size for _ in range(self._num_dpus)]

        self._kernel: List[int] = [0 for _ in range(self._num_dpus)]

    def num_executions(self) -> int:
        return self._num_executions

    def num_dpus(self) -> int:
        return self._num_dpus

    def input_dpu_mram_heap_pointer_name(self, execution: int, dpu_id: int) -> Optional[Bin]:
        assert 0 <= execution < self._num_executions
        assert 0 <= dpu_id < self._num_dpus

        bytes_: List[Byte] = []
        #决定读入区域多大 labels.bin




        element_immediate = Immediate(Representation.UNSIGNED, 32, self.a)#32位转4字节
        bytes_ += element_immediate.to_bytes()



        return Bin(bytes_)

    def output_dpu_mram_heap_pointer_name(self, execution: int, dpu_id: int) -> Optional[Bin]:
        assert 0 <= execution < self._num_executions
        assert 0 <= dpu_id < self._num_dpus

        bytes_: List[Byte] = []
        element_immediate = Immediate(Representation.UNSIGNED, 32, 10)
        bytes_ += element_immediate.to_bytes()

        return Bin(bytes_)

    def dpu_input_arguments(self, execution: int, dpu_id: int) -> Optional[Bin]:
        assert 0 <= execution < self._num_executions
        assert 0 <= dpu_id < self._num_dpus

        bytes_: List[Byte] = []

        # size_immediate = Immediate(Representation.UNSIGNED, 32, self._size[dpu_id])
        # bytes_ += size_immediate.to_bytes()
        #
        # transfer_size_immediate = Immediate(Representation.UNSIGNED, 32, self._transfer_size[dpu_id])
        # bytes_ += transfer_size_immediate.to_bytes()
        #
        # kernel_immediate = Immediate(Representation.UNSIGNED, 32, self._kernel[dpu_id])
        # bytes_ += kernel_immediate.to_bytes()

        return Bin(bytes_)

    def dpu_results(self, execution: int, dpu_id: int) -> Optional[Bin]:
        assert 0 <= execution < self._num_executions
        assert 0 <= dpu_id < self._num_dpus

        return None
