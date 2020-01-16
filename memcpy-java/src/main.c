#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include "benchmark.h"
#include "memcopy.h"

#define ITERATIONS 2000
#define BUF_SIZE 4096 * 1024

_Alignas(4096) char src[BUF_SIZE];
_Alignas(4096) char dest[BUF_SIZE];

int main(void){
    int fd = open("/dev/urandom", O_RDONLY);
    read(fd, src, sizeof src);
    printf("%s\n", src);
    avx_nt_memcpy(dest, src, sizeof src);
    printf("%s\n", dest);

    unsigned iterations = 20;
    unsigned current_iteration = 1;
    while(current_iteration <= iterations){
        uint64_t time = benchmark_copy_function(ITERATIONS, avx_nt_memcpy, dest, src, sizeof src);
        printf("Iteration %d result: %lu\n", current_iteration, time);
        current_iteration++;
    }
}