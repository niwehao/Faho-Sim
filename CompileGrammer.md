## 立即数

立即值以数值形式表示：

* 十六进制无符号数（以 0x为前缀 ）
* 二进制无符号数（前缀为 0b）
* 使用 ASCII 值（括号扩住ascii符号，例如：\'a'对于数值 97）
* 或者有符号的十进制值

## 寄存器

| 姓名               | 描述                                                                                  |
| ------------------ | ------------------------------------------------------------------------------------- |
| rX                 | 32 位读/写寄存器，X 范围为 [0..23]                                                    |
| sX                 | 32 位读/写*安全*寄存器，X 范围为 [0..23]                                            |
| dx                 | 64 位读/写寄存器，X 为 [0..22] 范围内的偶数值寄存器dx是r(x/2)（最高有效位）和r(X/2+1) |
| id                 | 特殊只读寄存器等于调用线程的编号                                                      |
| idx                | 特殊只读寄存器，其值为调用线程数的 X 倍。X 等于 2、4 或 8。                           |
| zero,one,lneg,mneg | 特殊只读寄存器返回系统常量，分别等于zero，one和0xffffffff,0x0000000。                 |

## 标签

跟踪源代码中的特定位置，这些位置随后可以被任何指令作为立即数引用。通常，标签由指令使用 `<span class="pre">jump</span>`，`<span class="pre">call</span>` 用于更改程序计数器的值，从而移动到标记的位置。

标签以单独的行表示，后跟冒号。

## 组合语法

指令格式:INSTRUCTION TARGET_REGISTER, OPERANDS, CONDITION, PC

* 将TARGET_REGISTER 设置为执行 INSTRUCTION和OPERANDS(操作数)的结果
* 如果操作结果验证CONDITION，则跳转到指定的指令PC

## **测试操作**

```
INSTRUCTION TARGET_REGISTER, OPERANDS, CONDITION
```

* 把target_register设置成1,如果在执行instruction operands的情况下,满足condition
* 否则设置寄存器为 0

## DMA 操作

DPU 没有数据和指令缓存，而是两个快速存储器：

> * 指令 RAM，称为**IRAM**
> * 暂存器，称为**WRAM**

**从 64 兆字节存储器阵列 ( MRAM** ) 到存储器的传输由特定的 DMA 加载和存储指令管理：

> * *ldma* ：将 N 个字节从 MRAM 加载到 WRAM
> * *sdma* ：将 N 个字节从 WRAM 存储到 MRAM
> * *ldmai* ：将 N 个字节从 MRAM 加载到 IRAM

DMA 传输受到 3 条特定规则的限制：

> * WRAM 和 MRAM 中的基地址按 8 字节对齐
> * 传输大小在8字节至2048字节（含）范围内
> * 传输大小是8字节的倍数

对齐规则由 DPU 隐式处理，通过自动屏蔽地址来对齐所需的边界。

当考虑从**MRAM**到**IRAM 的**传输时，应该理解：

> * 指令长度为 64 位（其最高有效字节设置为 0）
> * **IRAM**中的基本传输地址应以字节为单位（例如，地址 8 对应于**IRAM**中的第二条指令）

## 调度

从线程的角度来看，任何指令的表观延迟始终为**一个周期**。这是通过以下方式确保的：

> * 在任何给定时间使用旋转流水线，**一个线程只能在流水线中执行一条指令**，因此流水线阶段**不具有任何指令依赖性,并不是拆分各种取指阶段来执行**
> * **执行 DMA 指令的线程会立即挂起，直到传输完成**。DMA 指令是唯一一条没有被流水线完全执行的指令

在特殊情况下，给定线程执行的**上一条指令的结果以及当前指令操作数的获取**可能需要多次访问通用寄存器文件。在这种情况下，会先将**上一条指令的结果存储到正确的寄存器中，然后再重放该指令**，这意味着多了一个执行周期。由于流水线不会停滞，因此其他线程的执行不会受到此重放机制的影响。

为了更详细地理解重放机制，必须考虑两类操作数，分别表示OpA和OpB：

> * A：任何通用或特殊的 32 位寄存器
> * B：其中之一
>   * 通用 32 位寄存器
>   * 通用 64 位寄存器
>   * 即时值
>   * 特殊登记册id

如果一条指令具有以下属性之一，那么它将无需额外的周期即可执行：

> * 使用立即数作为 `OpB`或没有 `OpB`操作数
> * 使用特殊寄存器作为 `OpA`或没有 `OpA`操作数
> * 使用前一条指令的结果作为 `OpA`和/或 `OpB`
> * 使用两个通用 32 位寄存器作为 `OpA`和 `OpB`，其中一个寄存器具有偶数索引（例如 `r2`），另一个寄存器具有奇数索引（例如 `r5`）

要了解某条指令是否需要一个额外的周期来执行，应按以下步骤操作：

> * 计算前一条指令的写访问次数：
>   * 使用两个变量：偶数计数器和奇数计数器，均初始化为 0
>   * 如果上一条指令**生成一个 32 位结果到具有偶数索引**的通用寄存器中（例如 `r6`），则增加偶数计数器
>   * 如果上一条指令**生成一个 32 位结果到具有奇数索引**的通用寄存器中（例如 `r9`），则增加奇数计数器
>   * 如果指令生成 64 位结果存入寄存器，则增加两个计数器
> * 计算当前指令的读访问次数：
>   * 如果该指令**使用表示前一条指令写入的 32 位寄存器的操作数**，则**让相应的偶数或奇数计数器保持不变**，因为对寄存器文件的读取访问将被绕过
>   * 否则，如果指令使用代表特殊寄存器的操作数，则让偶数和奇数计数器保持不变
>   * 否则，根据**指令使用的操作数增加偶数和/或奇数计数器**。
>   * 对于 64 位操作数，应考虑表示该操作数的 32 位奇数寄存器和 32 位偶数寄存器来考虑相同的过程
> * 检查访问端口限制：
>   * 如**果偶数或奇数计数器（或两者）大于 2，则当前指令需要额外的周期来执行**

## 锁

为了实现快速高效的软件排除（例如互斥），DPU 提供了基于 原子位寄存器的*获取*和*释放*指令。其背后的理念是，线程可以：

> * *通过对原子位执行获取操作*来获取锁，该操作会设置该原子位。当与“非零”条件一起使用，并在同一指令上执行跳转时，线程将重复执行该指令，直到原子位从未设置变为设置
> * *通过对原子位执行释放*来释放锁，其效果是清除相应的原子位

DPU 通过计算原子位地址的两个最低有效字节的异或来对原子位地址进行散列。

对于地址散列机制：

当程序尝试使用一个内存地址作为锁时，DPU不是直接使用该地址，而是通过对地址进行散列(hash)操作，将其映射到实际的原子位寄存器。

具体地说：

1. DPU取原始锁地址的最低两个字节（假设地址为0x12345678，则取0x5678）
2. 对这两个字节执行异或(XOR)操作：例如，可能是将0x56与0x78进行XOR
3. 用计算出的散列值确定实际使用哪个原子位寄存器

这种机制的目的：

* **减少冲突** ：如果DPU只有有限数量的原子位寄存器，散列可以帮助更均匀地分布不同锁的访问
* **提高访问效率** ：通过散列可以将不同地址的锁映射到硬件支持的原子位寄存器上
* **简化硬件实现** ：不需要为每个可能的地址都提供原子操作支持

## 教学指令集语法:

#### Type

*TYPE* summarizes the type of each argument. Possible immediate types are summarized here-after:

> | Type | Corresponds to             |
> | ---- | -------------------------- |
> | u5   | 5 bits unsigned immediate  |
> | u8   | 8 bits unsigned immediate  |
> | u16  | 16 bits unsigned immediate |
> | u32  | 32 bits unsigned immediate |
> | s8   | 8 bits unsigned immediate  |
> | s16  | 16 bits unsigned immediate |
> | s32  | 32 bits unsigned immediate |

* **溢出行为** ：
* 无符号溢出是模运算，如255 + 1 = 0
* 有符号溢出可能导致从正变负或从负变正，如127 + 1 = -128
* **比较操作** ：
* 无符号比较：0xFF > 0x01
* 有符号比较：0xFF (-1) < 0x01 (1)
* **位移操作** ：
* 算术右移(对有符号数)保留符号位
* 逻辑右移(对无符号数)用0填充
* **位扩展行为** ：
* 无符号扩展：用0填充高位
* 有符号扩展：复制符号位到高位5
* 

Register arguments are represented by “abstract” register names:

> | Name    | Corresponds to                                                                  |
> | ------- | ------------------------------------------------------------------------------- |
> | rc      | 32-bits writable register: one of `r0`, `r1`… `r23`                      |
> | rb      | 32-bits writable register: one of `r0`, `r1`… `r23`                      |
> | ra      | 32-bits register: one of `r0`,`r1`…`r23` or a read-only register        |
> | dc,db   | 64-bits writable register: one of `d0`, `d1`… `d11`                      |
> | dce,dbe | The most significant bits of 64-bits writable registers `dc` and `db 高32`  |
> | dco,dbo | The least significant bits of 64-bits writable registers `dc` and `db 低32` |

Available read-only registers are:

- **id, id2, id4, id8**: the current thread number, multiplied by 1, 2, 4, 8 respectively
- **zero, one, lneg, mneg**: special constant register

**Behavior**

Plain description of instruction behaviors use a number of conventions and notations to simplify the reading.

> | Operation | Description                                                |
> | --------- | ---------------------------------------------------------- |
> | =         | Set the value of a register (or temporary variable         |
> | <-        | Set the value of one or multiple flags                     |
> | jump      | Change PC value                                            |
> | call      | Save the value of PC+1 and change PC value                 |
> | boot      | Reset the PC of a thread and start it                      |
> | resume    | Start a thread without resetting its PC value              |
> | acquire   | Acquire a lock                                             |
> | release   | Release a lock                                             |
> | read RB   | Read the specified run bit                                 |
> | clear RB  | Clear the specified run bit                                |
> | T:config  | Configure the performance counter                          |
> | T:read    | Read the performance counter                               |
> | sats      | Saturation function: (value < 0) ? 0x7FFFFFFF : 0x80000000 |
> | `~`     | Flip bits                                                  |
> | `+`     | Arithmetic add                                             |
> | `-`     | Arithmetic sub                                             |
> | `*`     | Multiply                                                   |
> | `\|`     | Bitwise or                                                 |
> | `&`     | Bitwise and                                                |
> | `^`     | Bitwise exclusive or                                       |
> | `>>`    | Shift to the right                                         |
> | `<<`    | Shift to the left                                          |
> | `<<`    | Rotate bits to the left                                    |
> | `>>`    | Rotate bits to the right                                   |
> | `>>`    | Arithmetic shift to the right                              |

## Note

 线程往往私有寄存器

 没有condition的情况下就清空条件,condition本质是跳转条件的检查

丢失:

#### addc

addc会检查目前的进位符号,已经集成到add函数内部

Asr 右移


#### u s 比较:

取决于最后写入的值

  //add rc:wr32 ra:r32 imm:s8 add_nz_cc:cc pc:pc16
  /**
  *- x = ra + imm

- rc = x
- if (add_nz_cc x) then
- jump @[pc]
- ZF,CF <- x
  ***/

  //add.u dc:wr64 ra:r32 imm:s8 add_nz_cc:cc pc:pc16
  /**

- x = ra + imm
- dc = x:U64
- if (add_nz_cc x) then
- jump @[pc]
- ZF,CF <- x
  ***/

  //add.s dc:wr64 ra:r32 imm:s8 add_nz_cc:cc pc:pc16
  /**

- x = ra + imm
- dc = x:S64
- if (add_nz_cc x) then
- jump @[pc]
- ZF,CF <- x
  ***/

cao 计算寄存器里有几个one bits

zero尝尝表示填充

clo: - x = count leading one bits of ra

"Count leading one bits"（计算前导1位的数量）是指从二进制数的最高有效位（即最左边的位）开始，计算连续的1的个数，直到遇到第一个0。

例如，如果 `ra`中存储的值是：

* `0b11110000`：有4个前导1（从最左边开始的4个连续的1）
* `0b11001100`：有2个前导1
* `0b01101110`：有0个前导1（因为最高位是0）
* `0b11111111`：有8个前导1（所有位都是1）

cls:计算从最高有效位开始连续相同的符号位的数量。

例如，假设我们有一个8位有符号整数：

* `0b00001111`：符号位是0，有3个前导符号位（最左边的3个0）
* `0b11110000`：符号位是1，有4个前导符号位（最左边的4个1）
* `0b01111111`：符号位是0，有1个前导符号位（只有最高位的一个0）
* `0b10000000`：符号位是1，有1个前导符号位（只有最高位的一个1）


clz计算leading zero bit

cmpb4:

```
- x = For i=[0..3] if byte ra[i] == byte rb[i] then byte i is set to 1, 0 otherwise

- rc = x

- ZF <- x
```

* 将寄存器ra和rb的内容按字节进行对比（每个寄存器分为4个字节，索引为0到3）
* 对于每个字节位置i：

  * 如果ra的第i个字节等于rb的第i个字节，则结果x的对应字节设为1
  * 否则，结果x的对应字节设为0
* 将生成的掩码x存入目标寄存器rc
* 同时更新零标志位(ZF)，基于结果x的值

div 除法

extsb 扩展8位

```
- x = ra[0:7]:S32

- rc = x

- ZF <- x
```

extsh 扩展16位

extub 无符号扩展

extuh 无符号扩展16位

lsl 左移动 lsl_add 移动后的值相加 lsl_sub相减

lsl1 左移动 1填充

lslx 取32-shift来移动    ra >> (32 - shift[0:4]) padded with ones

lsr 逻辑右移:变体同上

mul_sh_sh  :x = (ra[8:15] * rb[8:15]):S32, s可以变u

mul_sh_sl : x = (ra[8:15] * rb[0:7]):S32

nand:  = ~(ra & imm)

nor:  ~(ra | imm)  or是反过来

nxor:  ~(ra ^ imm)

orn:  x = ~ra | imm

rol: 

循环左移与普通左移的区别是：左移时移出的位不会丢失，而是从右侧"循环"回来。例如，对32位值0x12345678循环左移4位的结果是0x23456781。

```
- x = ra <<r shift[0:4]

- rc = x

- ZF <- x
```

ror 循环右移动

rsub: rb-ra(右减左)

sub: ra-rb

xor:ra^rb

stop call fault

sats:

饱和操作的含义是：

* 如果输入值在有效范围内，保持不变
* 如果输入值超出有效范围，则将其"截断"到范围边界

hash

time

lbs:"加载地址里的字节并符号扩展"(Load Byte Signed)的操作

例如，将一个8位的有符号数扩展到32位：

* 对于正数，如0x7F (01111111)，符号位是0，扩展后变成0x0000007F (00000000 00000000 00000000 01111111)
* 对于负数，如0x82 (10000010)，符号位是1，扩展后变成0xFFFFFF82 (11111111 11111111 11111111 10000010)

lbu 零扩展

ld:直接加载64位

lhs lhu 加载半个32位 即两个字节

lw:加载32位

sb:储存一个字节 sw储存4个字节

std::cout<<"test"<<std::endl;
