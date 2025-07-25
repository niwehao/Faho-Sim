class ConfigLoader:
    def __init__(self):
        pass

    @staticmethod
    def atomic_address_width() -> int:
        return 32

    @staticmethod
    def atomic_data_width() -> int:
        return 32

    @staticmethod
    def atomic_offset() -> int:
        return 0

    @staticmethod
    def atomic_size() -> int:
        return 256

    @staticmethod
    def iram_address_width() -> int:
        return 32

    @staticmethod
    def iram_data_width() -> int:
        return 96

    @staticmethod
    def wram_address_width() -> int:
        return 32

    @staticmethod
    def wram_data_width() -> int:
        return 32

   

    @staticmethod
    def stack_size() -> int:
        return 512

    @staticmethod
    def heap_size() -> int:
        return 4 * 1024

    @staticmethod
    def mram_address_width() -> int:
        return 32

    @staticmethod
    def mram_data_width() -> int:
        return 32


    @staticmethod
    def num_gp_registers() -> int:
        return 27

    @staticmethod
    def max_num_tasklets() -> int:
        return 24

    @staticmethod
    def min_access_granularity() -> int:
        return 8
    
    @staticmethod
    def mram_offset() -> int:
        return 636 * 1024   
    @staticmethod
    def mram_size() -> int:
        return 64 * 1024 * 1024
    @staticmethod
    def iram_offset() -> int:
        return 384 * 1024 #380k 可以到630k
    @staticmethod
    def iram_size() -> int:
        return 252 * 1024 #扩大大小  
    @staticmethod
    def wram_offset() -> int:
        return 512 
    @staticmethod
    def wram_size() -> int:
        return 256 * 1024 #23k 
    @staticmethod
    def wram_kernel_offset() -> int:
        return 128 * 1024 #//230000 230k 大小大概是120k左右 与用户界面的比例是15:2 
#开始于128k 大小是111k 可以到 240k 差不多等于(256k)
    @staticmethod
    def iram_kernel_offset() -> int:
        return 144 * 1024 #30:18 开始于400k 大小是40k 可以到达400+144+40 到580k 空余50k 对于单个inode最大可以占用64k/16*12=48k
    

    #内存分布 512-      -120k  目前位置58k
 