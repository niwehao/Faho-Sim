./build/src/uPIMulator --bindir /home/krakos/niwe/preempt/Faho_Sim_faho/uPIMulator_frontend/bin/16_dpus/ --num_tasklets 16 --benchmark KERNEL --application NW --logdir . --num_dpus 1 --data_prep 64 > result/back.txt

./build/src/uPIMulator --bindir /home/krakos/niwe/normal/Faho_Sim/uPIMulator_frontend/bin/16_dpus/ --num_tasklets 16 --benchmark KERNEL --application GEMV --logdir . --num_dpus 1 --data_prep 256 > result/back.txt
tmux a -t BFS
tmux new -s xxx
cmake -B build -S .
cmake --build build -j $(nproc)
python main.py --mode compile_by_toolchain --num_tasklets 16 --benchmark VA --num_dpus 16
python main.py --mode compile_by_toolchain --num_tasklets 16 --benchmark GEMV --num_dpus 16
cd ~/normal/Faho_Sim/uPIMulator_frontend/src
