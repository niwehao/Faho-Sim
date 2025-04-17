from typing import List, Optional, Set, Union
from elftools.elf.elffile import ELFFile
from elftools.elf.sections import SymbolTableSection
from elftools.elf.descriptions import describe_sh_flags
class Section:
    pass

class Executable:
    def __init__(self,  path: str):
        self.path = path
        self._sections: Set[Section] = set()
    def parse(self):
        pass

    



