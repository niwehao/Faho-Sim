#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
自动执行所有基准测试配置的脚本
根据 VS Code 的 launch.json 配置自动运行所有基准测试
"""

import subprocess
import sys
import os
import datetime
from pathlib import Path

def run_benchmark(name, benchmark_type, log_dir="logs"):
    """
    执行单个基准测试
    
    Args:
        name (str): 配置名称
        benchmark_type (str): 基准测试类型
        log_dir (str): 日志目录
    
    Returns:
        bool: 执行是否成功
    """
    # 确保日志目录存在
    Path(log_dir).mkdir(exist_ok=True)
    
    # 构建执行命令
    execute_cmd = [
        sys.executable,  # 使用当前Python解释器
        "main.py",
        "--mode", "compile_by_toolchain",
        "--num_tasklets", "16",
        "--benchmark", benchmark_type,
        "--num_dpus", "16"
    ]
    
    # 创建日志文件名
    timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    log_file = Path(log_dir) / f"{name}_{timestamp}.log"
    
    print(f"正在执行: {name} ({benchmark_type})")
    print(f"命令: {' '.join(execute_cmd)}")
    print(f"日志文件: {log_file}")
    print("-" * 80)
    
    try:
        with open(log_file, 'w', encoding='utf-8') as f:
            # 写入执行信息到日志文件
            f.write(f"执行时间: {datetime.datetime.now()}\n")
            f.write(f"配置名称: {name}\n")
            f.write(f"基准测试: {benchmark_type}\n")
            f.write(f"执行命令: {' '.join(execute_cmd)}\n")
            f.write("=" * 80 + "\n\n")
            f.flush()
            
            # 执行命令
            result = subprocess.run(
                execute_cmd,
                stdout=f,
                stderr=subprocess.PIPE,
                check=True,
                text=True
            )
            
            # 如果有错误输出，也写入日志文件
            if result.stderr:
                f.write("\n" + "=" * 80 + "\n")
                f.write("错误输出:\n")
                f.write(result.stderr)
        
        print(f"✅ {name} 执行成功")
        return True
        
    except subprocess.CalledProcessError as e:
        print(f"❌ {name} 执行失败!")
        print(f"返回码: {e.returncode}")
        if e.stderr:
            print(f"错误信息: {e.stderr}")
        
        # 将错误信息也写入日志文件
        try:
            with open(log_file, 'a', encoding='utf-8') as f:
                f.write(f"\n执行失败! 返回码: {e.returncode}\n")
                if e.stderr:
                    f.write(f"错误信息: {e.stderr}\n")
        except:
            pass
        
        return False
    
    except Exception as e:
        print(f"❌ {name} 执行时发生未知错误: {e}")
        return False

def main():
    """主函数"""
    # 检查 main.py 是否存在
    if not os.path.exists("main.py"):
        print("❌ 错误: 找不到 main.py 文件!")
        print("请确保在正确的工作目录中运行此脚本。")
        sys.exit(1)
    
    # 定义所有的基准测试配置
    # 根据 launch.json 中的配置顺序
    benchmarks = [
    #    ("Debug VA", "VA"),
    #     ("Debug TS", "TS"),
    #     ("Debug SEL", "SEL"),
    #     ("Debug RED", "RED"),
    #     ("Debug NW", "NW"),
    #     ("Debug MLP", "MLP"),
    #     ("Debug HSTS", "HST-S"),
    #     ("Debug GEMV", "GEMV"),
    #     ("Debug BS", "BS"),
    #     ("Debug BFS", "BFS"),
        ("Debug KERNEL", "KERNEL")
    ]
    
    print("🚀 开始执行所有基准测试配置")
    print(f"总共 {len(benchmarks)} 个配置")
    print("=" * 80)
    
    start_time = datetime.datetime.now()
    success_count = 0
    
    # 依次执行每个配置
    for i, (name, benchmark_type) in enumerate(benchmarks, 1):
        print(f"\n[{i}/{len(benchmarks)}] 执行配置: {name}")
        
        success = run_benchmark(name, benchmark_type)
        
        if success:
            success_count += 1
            print(f"进度: {success_count}/{len(benchmarks)} 成功")
        else:
            print(f"\n💥 执行失败! 在配置 '{name}' 处终止")
            print(f"已成功执行: {success_count}/{len(benchmarks)} 个配置")
            sys.exit(1)
        
        print("-" * 40)
    
    # 所有任务完成
    end_time = datetime.datetime.now()
    duration = end_time - start_time
    
    print("\n🎉 所有基准测试配置执行完成!")
    print(f"总耗时: {duration}")
    print(f"成功执行: {success_count}/{len(benchmarks)} 个配置")
    print(f"开始时间: {start_time.strftime('%Y-%m-%d %H:%M:%S')}")
    print(f"结束时间: {end_time.strftime('%Y-%m-%d %H:%M:%S')}")
    print("详细日志请查看 logs/ 目录")

if __name__ == "__main__":
    main()