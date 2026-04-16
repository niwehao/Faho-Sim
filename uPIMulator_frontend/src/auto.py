#!/usr/bin/env python3

import subprocess
import sys
import os
import datetime
from pathlib import Path


def run_benchmark(name, benchmark_type, log_dir="logs"):
    Path(log_dir).mkdir(exist_ok=True)

    execute_cmd = [
        sys.executable,
        "main.py",
        "--mode", "compile_by_toolchain",
        "--num_tasklets", "16",
        "--benchmark", benchmark_type,
        "--num_dpus", "16",
    ]

    timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    log_file = Path(log_dir) / f"{name}_{timestamp}.log"

    print(f"[run] {name} ({benchmark_type})")
    print(f"[cmd] {' '.join(execute_cmd)}")
    print(f"[log] {log_file}")
    print("-" * 80)

    try:
        with open(log_file, "w", encoding="utf-8") as f:
            f.write(f"time: {datetime.datetime.now()}\n")
            f.write(f"name: {name}\n")
            f.write(f"benchmark: {benchmark_type}\n")
            f.write(f"command: {' '.join(execute_cmd)}\n")
            f.write("=" * 80 + "\n\n")
            f.flush()

            result = subprocess.run(
                execute_cmd, stdout=f, stderr=subprocess.PIPE, check=True, text=True
            )

            if result.stderr:
                f.write("\n" + "=" * 80 + "\n")
                f.write("stderr:\n")
                f.write(result.stderr)

        print(f"[ok] {name}")
        return True

    except subprocess.CalledProcessError as e:
        print(f"[fail] {name} (exit {e.returncode})")
        if e.stderr:
            print(f"stderr: {e.stderr}")
        try:
            with open(log_file, "a", encoding="utf-8") as f:
                f.write(f"\nfailed with exit code: {e.returncode}\n")
                if e.stderr:
                    f.write(f"stderr: {e.stderr}\n")
        except OSError:
            pass
        return False

    except Exception as e:
        print(f"[fail] {name} unexpected error: {e}")
        return False


def main():
    if not os.path.exists("main.py"):
        print("error: main.py not found. Run this from uPIMulator_frontend/src/.")
        sys.exit(1)

    benchmarks = [
        ("Debug KERNEL", "KERNEL"),
    ]

    print(f"running {len(benchmarks)} benchmark config(s)")
    print("=" * 80)

    start_time = datetime.datetime.now()
    success_count = 0

    for i, (name, benchmark_type) in enumerate(benchmarks, 1):
        print(f"\n[{i}/{len(benchmarks)}] {name}")

        if run_benchmark(name, benchmark_type):
            success_count += 1
            print(f"progress: {success_count}/{len(benchmarks)}")
        else:
            print(f"\naborted on '{name}'; {success_count}/{len(benchmarks)} done")
            sys.exit(1)

        print("-" * 40)

    end_time = datetime.datetime.now()
    duration = end_time - start_time

    print("\nall benchmark configs completed")
    print(f"elapsed: {duration}")
    print(f"succeeded: {success_count}/{len(benchmarks)}")
    print(f"start: {start_time:%Y-%m-%d %H:%M:%S}")
    print(f"end:   {end_time:%Y-%m-%d %H:%M:%S}")
    print("see logs/ for details")


if __name__ == "__main__":
    main()
