section .text

global avx_copy_64_two_cache_lines
global avx_copy_cache_line
global avx_ntcopy_cache_line
global avx_ntcopy_64_two_cache_lines
global avx_nt_memcpy
global avx_nt_memcpy_forward

;rdi -- dest
;rsi -- src
;rdx -- size
avx_nt_memcpy:
    shr rdx, 0x3
avx_nt_memcpy_loop:
    sub rdx, 0x8
    vmovdqa ymm0, [rsi + 8*rdx]
    vmovntdq [rdi + rdx*8], ymm0
    vmovdqa ymm1, [rsi + 8*rdx + 0x20]
    vmovntdq [rdi + rdx*8 + 0x20], ymm1
    jnz avx_nt_memcpy_loop
    ret

;rdi -- dest
;rsi -- src
;rdx -- size
avx_nt_memcpy_forward:
    shr rdx, 0x3
    xor rcx, rcx
avx_nt_memcpy_forward_loop:
    vmovdqa ymm0, [rsi + 8*rcx]
    vmovntdq [rdi + rcx*8], ymm0
    vmovdqa ymm1, [rsi + 8*rcx + 0x20]
    vmovntdq [rdi + rcx*8 + 0x20], ymm1
    add rcx, 0x08
    cmp rdx, rcx
    ja avx_nt_memcpy_forward_loop
    ret

avx_copy_cache_line:
    vmovdqa ymm0, [rdi]
    vmovdqa ymm1, [rdi + 0x20]
    vmovdqa [rsi], ymm0
    vmovdqa [rsi + 0x20], ymm1
    ret

avx_copy_64_two_cache_lines:
    vmovdqa ymm0, [rdi]
    vmovdqa ymm1, [rdi + 0x40]
    vmovdqa [rsi], ymm0
    vmovdqa [rsi + 0x40], ymm1
    ret

avx_ntcopy_cache_line:
    vmovdqa ymm0, [rdi]
    vmovdqa ymm1, [rdi + 0x20]
    vmovntdq [rsi], ymm0
    vmovntdq [rsi + 0x20], ymm1
    ret

avx_ntcopy_64_two_cache_lines:
    vmovdqa ymm0, [rdi]
    vmovdqa ymm1, [rdi + 0x40]
    vmovntdq [rsi], ymm0
    vmovntdq [rsi + 0x40], ymm1
    ret