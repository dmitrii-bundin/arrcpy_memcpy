#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include "memcopy.h"

#define ITERATIONS 10
#define BUF_SIZE 16 * 1024 * 1024

_Alignas(32) char src[BUF_SIZE];
_Alignas(32) char dest[BUF_SIZE];

static void __run_benchmark(unsigned runs, unsigned run_iterations,
                    void *(*fn)(void *, const void*, size_t), void *dest, const void* src, size_t sz);

#define run_benchmark(runs, run_iterations, fn, dest, src, sz) \
    do{\
        printf("Benchmarking " #fn "\n");\
        __run_benchmark(runs, run_iterations, fn, dest, src, sz);\
    }while(0)

int main(void){
    int fd = open("/dev/urandom", O_RDONLY);
    read(fd, src, sizeof src);
    // avx_memcpy_forward_ls_noindex(dest, src, BUF_SIZE);
    // printf("%s\n%s\n", src, dest);
    // printf("%s\n", dest);
    // run_benchmark(20, ITERATIONS, gpi_memcopy, dest, src, BUF_SIZE);
    // run_benchmark(20, ITERATIONS, avx_nt_memcpy_forward_llss, dest, src, BUF_SIZE);
    run_benchmark(20, ITERATIONS, avx_memcpy_forward_llss, dest, src, BUF_SIZE);
    // run_benchmark(20, ITERATIONS, avx_memcpy_forward_ls, dest, src, BUF_SIZE);
    // run_benchmark(20, ITERATIONS, avx_memcpy_forward_ls_noindex, dest, src, BUF_SIZE);
    // run_benchmark(20, ITERATIONS, avx_memcpy_baseline, dest, src, BUF_SIZE);
}

static inline void benchmark_copy_function(unsigned iterations, void *(*fn)(void *, const void *, size_t),
                                               void *restrict dest, const void *restrict src, size_t sz){
    while(iterations --> 0){
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
        fn(dest, src, sz);
    }
}

static void __run_benchmark(unsigned runs, unsigned run_iterations,
                    void *(*fn)(void *, const void*, size_t), void *dest, const void* src, size_t sz){
    unsigned current_run = 1;
    while(current_run <= runs){
        benchmark_copy_function(run_iterations, fn, dest, src, sz);
        printf("Run %d finished\n", current_run);
        current_run++;
    }
}