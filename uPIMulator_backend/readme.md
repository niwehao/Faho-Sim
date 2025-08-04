./build/src/uPIMulator --bindir /home/krakos/niwe/preempt/Faho_Sim_faho/uPIMulator_frontend/bin/16_dpus/ --num_tasklets 16 --benchmark KERNEL --application BS --logdir . --num_dpus 1 --data_prep 262144 > back.txt

tmux a -t BFS
tmux new -s xxx
cmake -B build -S .
cmake --build build -j $(nproc)
python main.py --mode compile_by_toolchain --num_tasklets 16 --benchmark KERNEL --num_dpus 16
./build/src/uPIMulator  --bindir /home/krakos/niwe/Faho_Sim/uPIMulator_frontend/bin/16_dpus/ --num_tasklets 16 --benchmark KERNEL --application BFS  --logdir . --num_dpus 1 --data_prep 0  > result/back.txt