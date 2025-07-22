./build/src/uPIMulator --bindir /home/krakos/niwe/preempt/Faho_Sim_faho/uPIMulator_frontend/bin/16_dpus/ --num_tasklets 16 --benchmark KERNEL --application NW --logdir . --num_dpus 1 --data_prep 64 > back.txt

tmux a -t BFS
tmux new -s xxx
cmake -B build -S .
cmake --build build -j $(nproc)