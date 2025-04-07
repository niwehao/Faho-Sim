#ifndef UPMEM_SIM_ENCODER_BYTE_H_
#define UPMEM_SIM_ENCODER_BYTE_H_

#include <cassert>

namespace upmem_sim::encoder {

class Byte {
 public:
  explicit Byte(int value) : value_(value) {
    assert(0 <= value and value < 256);
  }
  ~Byte() = default;

  int value() { return value_; }

 private:
  int value_;
};

}  // namespace upmem_sim::encoder

#endif
/**这个类提供了：
字节级别的数据封装
值范围的安全保证
清晰的数据表示
简单的接口设计
是UPMEM模拟器中基础的数据处理单元。 */
