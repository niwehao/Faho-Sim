
/*Load size_text from MRAM to IRAM (at offset 0 and 0)
This function can overwrite itself
*/


#include <mram.h>


void load_prg_memory(unsigned int size_text) {
  
    unsigned int temp = size_text;
  
    unsigned int off = 0;
    while (temp >= 0x800) { // write by slot of 2048
  
      temp -= 0x800;
      unsigned int ra = off | (0xff << 24);
  
      __asm__ volatile( // there is no lib fun for IRAM data trasnfert so use the
                        // ldmai
          "\tldmai %[ra], %[mram_place], 0\n"
          :
          : [ra] "r"(ra), [mram_place] "r"(off));
      off += 0x800;
    }
    unsigned int ra;
    if (temp & 8)
      ra = off | (((temp >> 3)) << 24);
    else
      ra = off | (((temp >> 3) - 1) << 24);
    __asm__ volatile( // there is no lib fun for IRAM data trasnfert so use the
                      // ldmai
        "\tldmai %[ra], %[mram_place], 0\n"
        :
        : [ra] "r"(ra), [mram_place] "r"(off));
  }
int main(void){
    load_prg_memory(512);
    __asm__ volatile("\ttime r1\n");//1
    return 0;       //result MRAM 1<<16 should be 0 0
    
}