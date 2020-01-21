#ifndef MEMCOPY_H
#define MEMCOPY_H

void *avx_nt_memcpy(void *restrict, const void *restrict, size_t);

void *avx_nt_memcpy_forward(void *restrict, const void *restrict, size_t);

void avx_copy_64(void *dest, const void *src);

void avx_copy_32_32(void *dest, const void *src);

#endif //MEMCOPY_H