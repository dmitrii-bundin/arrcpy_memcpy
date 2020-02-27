#ifndef MEMCOPY_H
#define MEMCOPY_H

void *avx_nt_memcpy(void *restrict, const void *restrict, size_t);

//NT LoadStoreLoadStore
void *avx_nt_memcpy_forward_lsls(void *restrict, const void *restrict, size_t);

//NT LoadStore
void *avx_nt_memcpy_forward_ls(void *restrict, const void *restrict, size_t);

//NT LoadLoadStoreStore
void *avx_nt_memcpy_forward_llss(void *restrict, const void *restrict, size_t);

//NT LoadLoadLoadLoadStoreStoreStoreStore
void *avx_nt_memcpy_forward_llllssss(void *restrict, const void *restrict, size_t);

//WB LoadStoreLoadStore
void *avx_memcpy_forward_lsls(void *restrict, const void *restrict, size_t);

//WB LoadLoadStoreStore
void *avx_memcpy_forward_llss(void *restrict, const void *restrict, size_t);

//WB LoadStore
void *avx_memcpy_forward_ls(void *restrict, const void *restrict, size_t);

//WB LoadStore no index
void *avx_memcpy_forward_ls_noindex(void *restrict, const void *restrict, size_t);

//Copy baseline
void *avx_memcpy_baseline(void *restrict, const void *restrict, size_t);

//Copying using 8 bytes mov
void *gpi_memcopy(void *restrict, const void *restrict, size_t);

#endif //MEMCOPY_H