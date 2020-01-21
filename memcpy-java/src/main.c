#include <stdlib.h>
#include <inttypes.h>
#include <x86intrin.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include "memcopy.h"

#define ITERATIONS 10000000

//As @HadiBrais noted, there might be an issue with 4K aliasing
_Alignas(64) char src[128];
_Alignas(64) char dest[128];

static void __run_benchmark(unsigned runs, unsigned run_iterations,
                    void (*fn)(void *, const void*), void *dest, const void* src);

#define run_benchmark(runs, run_iterations, fn, dest, src) \
    do{\
        printf("Benchmarking " #fn "\n");\
        __run_benchmark(runs, run_iterations, fn, dest, src);\
    }while(0)

int main(void){
    int fd = open("/dev/urandom", O_RDONLY);
    read(fd, src, sizeof src);

    // run_benchmark(20, ITERATIONS, avx_copy_64, dest, src);
    run_benchmark(20, ITERATIONS, avx_copy_32_32, dest, src);
}

static inline void benchmark_2cache_lines_copy_function(unsigned iterations, void (*fn)(void *, const void *),
                                               void *restrict dest, const void *restrict src){
    while(iterations --> 0){
        fn(dest, src);
        fn(dest, src);
        fn(dest, src);
        fn(dest, src);
        fn(dest, src);
        fn(dest, src);
        fn(dest, src);
        fn(dest, src);
        fn(dest, src);
        fn(dest, src);
        fn(dest, src);
        fn(dest, src);
        fn(dest, src);
        fn(dest, src);
        fn(dest, src);
        fn(dest, src);
    }
}

static void __run_benchmark(unsigned runs, unsigned run_iterations,
                    void (*fn)(void *, const void*), void *dest, const void* src){
    unsigned current_run = 1;
    while(current_run <= runs){
        benchmark_2cache_lines_copy_function(run_iterations, fn, dest, src);
        printf("Run %d finished\n", current_run);
        current_run++;
    }
}