#ifndef BENCHMARK_H
#define BENCHMARK_H

#include <stdlib.h>
#include <inttypes.h>
#include <x86intrin.h>

static int uint64_compare(const void *u1, const void *u2){
    uint64_t uint1 = *(uint64_t *) u1;
    uint64_t uint2 = *(uint64_t *) u2;
    if(uint1 < uint2){
        return -1;
    } else if (uint1 == uint2){
        return 0;
    } else {
        return 1;
    }
}

static inline uint64_t benchmark_copy_function(unsigned iterations, void *(*fn)(void *, const void *, size_t),
                                               void *restrict dest, const void *restrict src, size_t sz){
    uint64_t *results = malloc(iterations * sizeof(uint64_t));
    unsigned idx = iterations;
    while(idx --> 0){
        uint64_t start = __rdtsc();
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
        uint64_t finish = __rdtsc();
        results[idx] = (finish - start) >> 4;
    }
    qsort(results, iterations, sizeof *results, uint64_compare);
    return results[iterations >> 1];
}

#endif //BENCHMARK_H