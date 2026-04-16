#ifndef UPMEM_SIM_SIMULATOR_SRAM_WRAM_H_
#define UPMEM_SIM_SIMULATOR_SRAM_WRAM_H_

#include "abi/word/data_address_word.h"
#include "abi/word/data_word.h"
#include <fstream>
#include <iostream>
#include <vector>
#include <filesystem>
#include <fstream>
#include <sstream>

namespace upmem_sim::simulator::sram {
class timetable
  {
  public:
    int time;
    std::string name;
    timetable(int time, std::string name) : time(time), name(name) {}
  };
class WRAM {
 public:
  explicit WRAM();
  ~WRAM();

  Address address() { return address_->address(); }
  Address size() { return size_; }

  int64_t read(Address address);

  void write(Address address, int64_t value);
  void write(Address address, encoder::ByteStream *byte_stream);

  void cycle() = delete;

 protected:
  // std::string wr_find(int value){
  //    timetable *timetable_p = nullptr;
  //      int found = 0;
  //     if (value < util::ConfigLoader::wram_offset() + util::ConfigLoader::wram_kernel_offset())
  //       for (auto &timetable_n : time_table_helloworld)
  //       {

  //         if (timetable_n->time == value)
  //         {

  //           return timetable_n->name;
  //           found = 1;
  //           break;
  //         }
  //         else if (timetable_n->time > value)
  //         {
  //           assert(timetable_p != nullptr);
            
  //           return timetable_p->name + "+" + std::to_string((value - timetable_p->time) );
            
  //           found = 1;
  //           break;
  //         }
  //         timetable_p = timetable_n;
  //       }
  //       if(!found) {
  //         return timetable_p->name + "+" + std::to_string((value - timetable_p->time) );
  //       }
  //     }
  //     else
  //       for (auto &timetable_n : time_table_)
  //       {
  //         if (timetable_n->time == value)
  //         {
  //           return timetable_n->name;
  //           // if(timetable_n->name == ".LBB40_2") {
  //           //   std::cout << "*** .LBB40_2" << std::endl;
  //           //   return;
  //           // }
  //           found = 1;
  //           break;
  //         }
  //         else if (timetable_n->time > value)
  //         {
  //           assert(timetable_p != nullptr);
  //           found=1;
  //           return timetable_p->name + "+" + std::to_string((value - timetable_p->time) );
  //           break;
  //         }
  //         timetable_p = timetable_n;
  //       }
  //     }
  //     if(!found) {
  //       return timetable_p->name + "+" + std::to_string((value - timetable_p->time) );
  //     } 
  // }
  static int num_data_words() {
    return static_cast<int>(util::ConfigLoader::wram_size() /
                            abi::word::DataWord().size());
  }
  int index(Address address);

 private:
  // std::vector<timetable *> time_table_helloworld;
  abi::word::DataAddressWord *address_;
  Address size_;
  std::vector<abi::word::DataWord *> cells_;
};

}  // namespace upmem_sim::simulator::sram

#endif
