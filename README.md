# Faho_Sim (faho-mmu)

> **Branch:** this branch adds an **MMU / virtual-memory layer** on top of
> the Faho kernel, exposing page-fault-driven paging for DPU workloads.
> See the `mmu*` notebooks under `uPIMulator_backend/result/` for the
> evaluation.

Faho_Sim is a cycle-accurate simulator for the UPMEM Processing-in-Memory
(PIM) platform with a **custom on-DPU kernel (Faho)** that supports running
multiple processes/applications on a single DPU with job scheduling, inode
I/O, inter-process sockets, and software preemption.

It is a fork of [uPIMulator](https://github.com/VIA-Research/uPIMulator) with
the following additions:

- A small in-DPU kernel (`faho`) that orchestrates multiple user
  applications (benchmarks) on one DPU.
- Extended backend simulator flags (`--application`, `--data_prep`) that
  select and size the guest application run by the kernel.
- Cooperative / preemptive scheduling between tasklets, synchronization
  primitives (sockets, barriers, mutexes), and a small inode-style file
  interface on MRAM.

## Repository Layout

```
Faho_Sim/
├── uPIMulator_frontend/       # Toolchain (Python)
│   ├── src/                   # compiler, linker, encoder, assembler
│   │   ├── main.py            # toolchain driver (compile + link)
│   │   ├── compiler/          # benchmark -> .S driver
│   │   ├── linker_/           # .S -> iram/wram/mram binaries
│   │   ├── assembler/         # data-prep helpers per benchmark
│   │   ├── encoder/           # UPMEM ISA encoder
│   │   └── parser_/           # ANTLR-generated assembly parser
│   ├── benchmark/             # benchmark source trees (includes KERNEL)
│   ├── benchmark_load/        # alternate benchmark variants
│   ├── asm/                   # generated/checked-in assembly
│   ├── sdk/                   # UPMEM stdlib / syslib / misc
│   ├── docker/                # compiler toolchain image
│   └── bin/                   # linker output (*.bin, ignored by git)
└── uPIMulator_backend/        # Cycle-level simulator (C++20)
    ├── src/
    │   ├── main.cc            # simulator entry
    │   ├── simulator/         # DPU / DRAM / SRAM / pipeline / scheduler
    │   ├── abi/               # UPMEM ISA definitions
    │   ├── encoder/ converter/ initializer/   # binary loading
    │   ├── faho/              # Faho kernel host-side model
    │   │   ├── def.{h,cc}     # process/job/inode/socket definitions
    │   │   ├── k1.{h,cc}      # K1 kernel orchestrator + syscalls
    │   │   ├── inode.{h,cc}   # inode-style I/O on MRAM
    │   │   ├── socket.{h,cc}  # inter-process sockets
    │   │   └── benchmark/     # per-application host classes
    │   └── util/
    ├── script/                # build.sh, run.sh, format.sh
    └── result/                # notebooks / figures (outputs ignored)
```

The on-DPU kernel itself is built from
`uPIMulator_frontend/benchmark/KERNEL/` (`kernel.c`, `kernel.h`,
`jobs.h`, `sync.h`, `socket.h`, `inode.h`, `syscall.h`, `lib.S`, ...).
Applications running inside the kernel are the usual PrIM-style
workloads (BFS, BS, GEMV, HST-S, MLP, NW, RED, SEL, TS, VA).

## Branches

| Branch         | Purpose                                                    |
|----------------|------------------------------------------------------------|
| `faho`         | Baseline: multi-process kernel + software preemption.       |
| `faho-mmu`     | Adds an MMU / virtual-memory layer on the DPU.             |
| `faho-preempt` | Focused work on preemption refinements and evaluation.     |

## Prerequisites

- Python ≥ 3.10
- C++20-compliant compiler (g++ 10+, clang 12+)
- CMake ≥ 3.16
- Docker (for the UPMEM compiler toolchain)
- Linux (tested on Ubuntu 20.04 / 22.04)
- User must be in the `docker` group

## Install & Build

### 1. Python dependencies (frontend)

```bash
cd uPIMulator_frontend
pip install -r requirements.txt
```

### 2. Build the UPMEM compiler image

Pull or build the compiler image once:

```bash
docker build -t bongjoonhyun/compiler \
    -f uPIMulator_frontend/docker/compiler.dockerfile .
```

### 3. Build the backend simulator

```bash
cd uPIMulator_backend/script
sh build.sh          # runs cmake + make into ../build/
```

The executable is at `uPIMulator_backend/build/src/uPIMulator`.

## Usage

Running a simulation is a two-stage pipeline:

1. **Frontend** — compile benchmark C → assembly → linked binary blobs
   (`iram.bin`, `wram.bin`, `mram.bin`, ...) under
   `uPIMulator_frontend/bin/<num_dpus>_dpus/<BENCHMARK>.<num_tasklets>/`.
2. **Backend** — load those blobs into the cycle-level simulator.

### Frontend: build the KERNEL binary

```bash
cd uPIMulator_frontend/src
python main.py --mode all \
               --benchmark KERNEL \
               --num_tasklets 16 \
               --num_dpus 1 \
               --data_prep_param 2048
```

Available `--mode` values (see `main.py`):

| Mode                  | What it does                                           |
|-----------------------|--------------------------------------------------------|
| `compile_sdk`         | Compile the SDK libraries (`misc`, `stdlib`, `syslib`).|
| `compile_by_toolchain`| Compile one benchmark via the UPMEM toolchain + link.  |
| `compile_load`        | Same, but from `benchmark_load/`.                      |
| `all`                 | `compile_sdk` + `compile_by_toolchain`.                |

`--benchmark KERNEL` is the primary target in Faho_Sim — the Faho kernel
is what actually runs on the DPU, and the guest *application* is picked
at simulation time via `--application`.

### Backend: run the simulator

```bash
cd uPIMulator_backend
./build/src/uPIMulator \
    --bindir  $(pwd)/../uPIMulator_frontend/bin/1_dpus/ \
    --logdir  . \
    --benchmark   KERNEL \
    --application BFS \
    --num_tasklets 16 \
    --num_dpus 1 \
    --data_prep 0
```

Key flags (see `uPIMulator_backend/src/main.cc`):

| Flag              | Meaning                                                                  |
|-------------------|--------------------------------------------------------------------------|
| `--bindir`        | Absolute path to the frontend output (`bin/<N>_dpus/`).                  |
| `--logdir`        | Directory for simulator log files.                                       |
| `--benchmark`     | The top-level program loaded on the DPU — use `KERNEL` for Faho runs.    |
| `--application`   | Guest application the kernel should launch (`BFS`, `BS`, `GEMV`, `HST-S`,`MLP`, `NW`, `RED`, `SEL`, `TS`, `VA`). |
| `--data_prep`     | Integer sizing parameter passed to the application's data-prep routine.  |
| `--num_tasklets`  | Number of tasklets (hardware threads) per DPU.                           |
| `--num_dpus`      | Number of DPUs to simulate.                                              |
| `--verbose`       | 0 = summary only, 1 = per-cycle instruction trace, 2 = + register dump.  |

Simulation results are printed to stdout; redirect as needed.

### Batch runs

`uPIMulator_backend/auto.py` runs a list of `(application, data_prep)`
configurations in one shot, writing each one's stdout under
`uPIMulator_backend/autolog/`.

```bash
cd uPIMulator_backend
python auto.py
```

Edit the `tasks` list in `auto.py` to pick the applications to run.

## Adding a new application

Applications run by the kernel are declared in two places:

- **DPU side**: a C source tree under
  `uPIMulator_frontend/benchmark/<NAME>/` (same structure as the
  existing PrIM-style benchmarks; a `dpu/` subfolder and a `makefile`).
- **Host/simulator side**: a class under
  `uPIMulator_backend/src/faho/benchmark/` that derives from the
  `Host` base and wires up `--application <NAME>` to the guest.

Once both are registered, rebuild the frontend KERNEL binary and pass
the new name via `--application`.

## Troubleshooting

- **`./build/src/uPIMulator not found`** — run `sh script/build.sh`
  from `uPIMulator_backend/`.
- **Linker / ANTLR errors on first frontend run** — rebuild the
  compiler image (`docker build -t bongjoonhyun/compiler ...`) and
  delete `uPIMulator_frontend/src/save_lib.pkl` to force a fresh link.
- **Simulation exits immediately with "failed to open file"** — check
  that `--bindir` is an *absolute* path and points at the
  `<num_dpus>_dpus/` directory produced by the frontend.

## License

Inherits the upstream uPIMulator license for the simulator core. The
Faho kernel additions are released under the same terms unless a
branch-specific LICENSE says otherwise.
