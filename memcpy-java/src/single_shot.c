#include <stdio.h>
#include <inttypes.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <immintrin.h>
#include <x86intrin.h>
#include "memcopy.h"

#define BUF_SIZE 2 * 1024

_Alignas(64) char src[BUF_SIZE];
_Alignas(64) char dest[BUF_SIZE];

static inline void warmup(unsigned wa_iterations, void *(*copy_fn)(void *, const void *, size_t));
static inline void generate_data(char *buf, size_t size);

int main(void){
    generate_data(src, sizeof src);
    
    warmup(100, avx_memcpy_forward_lsls);
    //Serialize and copiler barrier
    __asm__ volatile("mov $0, %%rax\n cpuid":::"rax", "memory");
    uint64_t cycles_start = __rdpmc((1 << 30) + 1);
    avx_memcpy_forward_llss(dest, src, sizeof src);
    __asm__ volatile("lfence" ::: "memory");
    uint64_t cycles_end = __rdpmc((1 << 30) + 1);
    printf("Core clock cycles = %" PRIu64 "\n", cycles_end - cycles_start);
}

static inline void warmup(unsigned wa_iterations, void *(*copy_fn)(void *, const void *, size_t)){
    //128 were picked up at random
    _Alignas(64) char src[128];
    _Alignas(64) char dest[128];
    while(wa_iterations --> 0){
        copy_fn(src, dest, sizeof dest);
        copy_fn(src, dest, sizeof dest);
        copy_fn(src, dest, sizeof dest);
        copy_fn(src, dest, sizeof dest);
        copy_fn(src, dest, sizeof dest);
        copy_fn(src, dest, sizeof dest);
        copy_fn(src, dest, sizeof dest);
        copy_fn(src, dest, sizeof dest);
    }
}

static inline void generate_data(char *buf, size_t sz){
    int fd = open("/dev/urandom", O_RDONLY);
    read(fd, buf, sz);
}