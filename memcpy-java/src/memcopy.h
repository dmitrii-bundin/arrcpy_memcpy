#ifndef MEMCOPY_H
#define MEMCOPY_H

void *avx_nt_memcpy(void *restrict, const void *restrict, size_t);

void *avx_nt_memcpy_forward(void *restrict, const void *restrict, size_t);

void avx_ntcopy_cache_line(void *dest, const void *src);

void avx_ntcopy_64_two_cache_lines(void *dest, const void *src);

#endif //MEMCOPY_H