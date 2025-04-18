all : host 
dpu : dpu.c 
	dpu-upmem-dpurte-clang -O3  -S   -DNR_TASKLETS=1 -g -o dpu.s dpu.c  
host : dpu host.c 
	gcc --std=c99 -O0 -g -o host host.c `dpu-pkg-config --cflags --libs dpu`  
clean :  
	rm -f dpu host