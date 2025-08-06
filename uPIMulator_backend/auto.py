import os
import subprocess
import sys

def run_upimulator_task(application, data_prep, output_file="t.txt"):
    """
    执行uPIMulator任务
    
    Args:
        application: 应用程序名称 (如 "TS", "SEL", "BS" 等)
        data_prep: 数据准备参数
        output_file: 输出文件名，默认为 "t.txt"
    """
    # 程序路径
    program = "./build/src/uPIMulator"
    
    # 构建执行命令
    execute_cmd = [
        program,
        "--bindir",
        "/home/krakos/niwe/normal/Faho_Sim/uPIMulator_frontend/bin/16_dpus/",
        "--num_tasklets",
        "16",
        "--benchmark",
        "KERNEL",
        "--application",
        application,
        "--logdir",
        ".",
        "--num_dpus",
        "1",
        "--data_prep",
        str(data_prep)
    ]
    
    print(f"正在执行 {application} 任务...")
    print(f"命令: {' '.join(execute_cmd)} > {output_file}")
    
    try:
        # 执行命令并将输出重定向到文件
        with open(output_file, 'w') as f:
            result = subprocess.run(execute_cmd, stdout=f, stderr=subprocess.PIPE, check=True)
        print(f"✓ {application} 任务执行成功，输出已保存到 {output_file}")
        return True
    except subprocess.CalledProcessError as e:
        print(f"✗ {application} 任务执行失败:")
        print(f"错误信息: {e.stderr.decode()}")
        return False
    except FileNotFoundError:
        print(f"✗ 找不到程序文件: {program}")
        return False

def main():
    # 定义所有任务配置
    tasks = [
             {"name": "TS", "data_prep": 2048},
            # {"name": "BS", "data_prep": 4096},
            # {"name": "VA", "data_prep": 131072},
            # {"name": "HST-S", "data_prep": 65536},
             #{"name": "GEMV", "data_prep": 256},
            # {"name": "RED", "data_prep": 131072},
            # {"name": "SEL", "data_prep": 8192}, 
            # {"name": "MLP", "data_prep": 256}, 
            # {"name": "NW", "data_prep": 128},
            # {"name": "BFS", "data_prep": 0}, #with100*5
       
       
        
    ]
    
    print("开始执行 uPIMulator 任务序列...")
    print("=" * 50)
    
    success_count = 0
    total_count = len(tasks)
    
    # 检查程序是否存在
    if not os.path.exists("./build/src/uPIMulator"):
        print("错误: 找不到 uPIMulator 程序文件")
        print("请确保已经编译了项目，并且当前目录正确")
        sys.exit(1)
    
    # 逐个执行任务
    for i, task in enumerate(tasks, 1):
        print(f"\n[{i}/{total_count}] 执行任务: {task['name']}")
        print("-" * 30)
        
        # 为每个任务创建单独的输出文件
        output_file = "atuo/"+f"{task['name']}_output.txt"
        
        if run_upimulator_task(task['name'], task['data_prep'], output_file):
            success_count += 1
        
        print()
    
    # 输出执行总结
    print("=" * 50)
    print(f"执行完成! 成功: {success_count}/{total_count}")
    
    if success_count < total_count:
        print(f"失败: {total_count - success_count} 个任务")
        sys.exit(1)
    else:
        print("所有任务都执行成功!")

if __name__ == "__main__":
    main()