
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
    __dma_aligned unsigned int a[2]={0,0};
    mram_write(&a,(__mram_ptr void *)(1<<16),8);
    // load_prg_memory(??);
    a[0]=1;
    a[1]=2;
    mram_write(&a,(__mram_ptr void *)(1<<16),8);
    return 0;       //result MRAM 1<<16 should be 0 0
    
}