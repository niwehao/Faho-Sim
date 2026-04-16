import os
import subprocess
import sys


def run_upimulator_task(application, data_prep, output_file="t.txt"):
    program = "./build/src/uPIMulator"

    execute_cmd = [
        program,
        "--bindir",
        "/home/krakos/niwe/normal/Faho_Sim/uPIMulator_frontend/bin/16_dpus/",
        "--num_tasklets", "16",
        "--benchmark", "KERNEL",
        "--application", application,
        "--logdir", ".",
        "--num_dpus", "1",
        "--data_prep", str(data_prep),
    ]

    print(f"[run] {application}")
    print(f"[cmd] {' '.join(execute_cmd)} > {output_file}")

    try:
        with open(output_file, "w") as f:
            subprocess.run(execute_cmd, stdout=f, stderr=subprocess.PIPE, check=True)
        print(f"[ok] {application} -> {output_file}")
        return True
    except subprocess.CalledProcessError as e:
        print(f"[fail] {application}: {e.stderr.decode()}")
        return False
    except FileNotFoundError:
        print(f"[fail] executable not found: {program}")
        return False


def main():
    tasks = [
        {"name": "BFS", "data_prep": 0},
    ]

    print("=" * 50)
    print(f"running {len(tasks)} uPIMulator task(s)")
    print("=" * 50)

    if not os.path.exists("./build/src/uPIMulator"):
        print("error: ./build/src/uPIMulator not found. Build the project first.")
        sys.exit(1)

    success = 0
    for i, task in enumerate(tasks, 1):
        print(f"\n[{i}/{len(tasks)}] {task['name']}")
        out = os.path.join("autolog", f"{task['name']}_output.txt")
        os.makedirs(os.path.dirname(out), exist_ok=True)
        if run_upimulator_task(task["name"], task["data_prep"], out):
            success += 1

    print("=" * 50)
    print(f"done: {success}/{len(tasks)} succeeded")
    sys.exit(0 if success == len(tasks) else 1)


if __name__ == "__main__":
    main()
