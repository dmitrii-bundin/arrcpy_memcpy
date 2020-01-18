#ifndef MEMCOPY_H
#define MEMCOPY_H

void *avx_nt_memcpy(void *restrict, const void *restrict, size_t);

void *avx_nt_memcpy_forward(void *restrict, const void *restrict, size_t);

void *avx_copy_cache_line(void *dest, const void *src, size_t sz);

#endif //MEMCOPY_H