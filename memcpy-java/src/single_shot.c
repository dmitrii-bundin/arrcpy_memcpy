#include <stdio.h>
#include <inttypes.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <immintrin.h>
#include <x86intrin.h>
#include "memcopy.h"

#define BUF_SIZE 4 * 1024

_Alignas(64) char src[BUF_SIZE];
_Alignas(64) char dest[BUF_SIZE];

static inline void warmup(unsigned wa_iterations, void *(*copy_fn)(void *, const void *, size_t));
static inline void cache_flush(char *buf, size_t size);
static inline void generate_data(char *buf, size_t size);

uint64_t run_benchmark(unsigned wa_iteration, void *(*copy_fn)(void *, const void *, size_t)){
    generate_data(src, sizeof src);
    warmup(1024 * 1024, copy_fn); 
    cache_flush(src, sizeof src);
    cache_flush(dest, sizeof dest);
    __asm__ __volatile__("mov $0, %%rax\n cpuid":::"rax", "rbx", "rcx", "rdx", "memory"); 
    uint64_t cycles_start = __rdpmc((1 << 30) + 1); 
    // uint64_t ref_cycles_start = __rdtsc();
    copy_fn(dest, src, sizeof src); 
    __asm__ __volatile__("lfence" ::: "memory"); 
    uint64_t cycles_end = __rdpmc((1 << 30) + 1); 
    // unsigned dummy = 0;
    // uint64_t ref_cycles_end = __rdtscp(&dummy);
    // return ref_cycles_end - ref_cycles_start; 
    return cycles_end - cycles_start;
}

int main(void){
    uint64_t single_shot_result = run_benchmark(1024, gpi_memcopy);
    printf("Core clock cycles = %" PRIu64 "\n", single_shot_result);
}

static inline void warmup(unsigned wa_iterations, void *(*copy_fn)(void *, const void *, size_t)){
    while(wa_iterations --> 0){
        copy_fn(dest, src, sizeof src);
        copy_fn(dest, src, sizeof src);
        copy_fn(dest, src, sizeof src);
        copy_fn(dest, src, sizeof src);
        copy_fn(dest, src, sizeof src);
        copy_fn(dest, src, sizeof src);
        copy_fn(dest, src, sizeof src);
        copy_fn(dest, src, sizeof src);
    }
}

static inline void generate_data(char *buf, size_t sz){
    int fd = open("/dev/urandom", O_RDONLY);
    read(fd, buf, sz);
}

static inline void cache_flush(char *buf, size_t sz){
    for(size_t i = 0; i < sz; i+=_SC_LEVEL1_DCACHE_LINESIZE){
        _mm_clflush(buf + i);
    }
}