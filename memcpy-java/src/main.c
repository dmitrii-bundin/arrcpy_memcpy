#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include "benchmark.h"
#include "memcopy.h"

#define ITERATIONS 100
#define BUF_SIZE 4 * 1024 * 1024

_Alignas(4096) char src[BUF_SIZE];
_Alignas(4096) char dest[BUF_SIZE];

void run_benchmark(unsigned runs, unsigned run_iterations,
                    void *(*fn)(void *, const void*, size_t), void *dest, const void* src, size_t sz){
    unsigned current_run = 1;
    while(current_run <= runs){
        uint64_t time = benchmark_copy_function(run_iterations, fn, dest, src, sz);
        printf("Run %d result: %lu\n", current_run, time);
        current_run++;
    }
}
int main(void){
    int fd = open("/dev/urandom", O_RDONLY);
    read(fd, src, sizeof src);
    printf("%s\n", src);
    avx_nt_memcpy_forward(dest, src, sizeof src);
    printf("%s\n", dest);

    run_benchmark(20, ITERATIONS, avx_nt_memcpy, dest, src, sizeof src);
    // unsigned iterations = 20;
    // unsigned current_iteration = 1;
    // while(current_iteration <= iterations){
    //     uint64_t time = benchmark_copy_function(ITERATIONS, avx_nt_memcpy, dest, src, sizeof src);
    //     printf("Iteration %d result: %lu\n", current_iteration, time);
    //     current_iteration++;
    // }

    // unsigned copy_cache_line_iteration_2 = 20;
    // unsigned copy_cache_line_current_iteration_2 = 1;
    // while(copy_cache_line_current_iteration_2 <= copy_cache_line_iteration_2){
    //     uint64_t time = benchmark_copy_function(ITERATIONS, avx_copy_cache_line, dest, src, sizeof src);
    //     printf("Iteration %d result: %lu\n", copy_cache_line_current_iteration_2, time);
    //     copy_cache_line_current_iteration_2++;
    // }
    
    // unsigned copy_cache_line_iteration = 20;
    // unsigned copy_cache_line_current_iteration = 1;
    // while(copy_cache_line_current_iteration <= copy_cache_line_iteration){
    //     uint64_t time = benchmark_copy_function(ITERATIONS, avx_copy_cache_line, dest, src, sizeof src);
    //     printf("Iteration %d result: %lu\n", copy_cache_line_current_iteration, time);
    //     copy_cache_line_current_iteration++;
    // }
}