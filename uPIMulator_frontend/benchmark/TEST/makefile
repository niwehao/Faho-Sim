all : host 
dpu : dpu.c 
	dpu-upmem-dpurte-clang -c -O0  -DNR_TASKLETS=16 -g -o dpu.o dpu.c  
host : dpu host.c 
	gcc --std=c99 -O0 -g -o host host.c `dpu-pkg-config --cflags --libs dpu`  
clean :  
	rm -f dpu host