#ifndef MEMCOPY_H
#define MEMCOPY_H

void *avx_nt_memcpy(void *restrict, const void *restrict, size_t);

//LoadStoreLoadStore
void *avx_nt_memcpy_forward_lsls(void *restrict, const void *restrict, size_t);

//LoadStore
void *avx_nt_memcpy_forward_ls(void *restrict, const void *restrict, size_t);

//LoadLoadStoreStore
void *avx_nt_memcpy_forward_llss(void *restrict, const void *restrict, size_t);

//LoadLoadLoadLoadStoreStoreStoreStore
void *avx_nt_memcpy_forward_llllssss(void *restrict, const void *restrict, size_t);

void avx_copy_64(void *dest, const void *src);

void avx_copy_32_32(void *dest, const void *src);

#endif //MEMCOPY_H