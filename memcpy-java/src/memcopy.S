section .text

extern memcpy

global avx_copy_64
global avx_copy_32_32
global avx_nt_memcpy
global avx_nt_memcpy_forward_lsls
global avx_nt_memcpy_forward_ls
global avx_nt_memcpy_forward_llss
global avx_nt_memcpy_forward_llllssss
global avx_memcpy_forward_lsls

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
avx_memcpy_forward_lsls:
    shr rdx, 0x3
    xor rcx, rcx
avx_memcpy_forward_loop_lsls:
    vmovdqa ymm0, [rsi + 8*rcx]
    vmovdqa [rdi + rcx*8], ymm0
    vmovdqa ymm1, [rsi + 8*rcx + 0x20]
    vmovdqa [rdi + rcx*8 + 0x20], ymm1
    add rcx, 0x08
    cmp rdx, rcx
    ja avx_memcpy_forward_loop_lsls
    ret

;rdi -- dest
;rsi -- src
;rdx -- size
avx_nt_memcpy_forward_lsls:
    shr rdx, 0x3
    xor rcx, rcx
avx_nt_memcpy_forward_loop_lsls:
    vmovdqa ymm0, [rsi + 8*rcx]
    vmovntdq [rdi + rcx*8], ymm0
    vmovdqa ymm1, [rsi + 8*rcx + 0x20]
    vmovntdq [rdi + rcx*8 + 0x20], ymm1
    add rcx, 0x08
    cmp rdx, rcx
    ja avx_nt_memcpy_forward_loop_lsls
    ret

avx_nt_memcpy_forward_ls:
    shr rdx, 0x3
    xor rcx, rcx
avx_nt_memcpy_forward_loop_ls:
    vmovdqa ymm0, [rsi + 8*rcx]
    vmovdqa [rdi + rcx*8], ymm0
    add rcx, 0x04
    cmp rdx, rcx
    ja avx_nt_memcpy_forward_loop_ls
    ret

;rdi -- dest
;rsi -- src
;rdx -- size
avx_nt_memcpy_forward_llss:
    shr rdx, 0x3
    xor rcx, rcx
avx_nt_memcpy_forward_loop_llss:
    vmovdqa ymm0, [rsi + 8*rcx]
    vmovdqa ymm1, [rsi + 8*rcx + 0x20]
    vmovntdq [rdi + rcx*8], ymm0
    vmovntdq [rdi + rcx*8 + 0x20], ymm1
    add rcx, 0x08
    cmp rdx, rcx
    ja avx_nt_memcpy_forward_loop_llss
    ret

;rdi -- dest
;rsi -- src
;rdx -- size
avx_nt_memcpy_forward_llllssss:
    shr rdx, 0x3
    xor rcx, rcx
avx_nt_memcpy_forward_loop_llllssss:
    vmovdqa ymm0, [rsi + 8*rcx]
    vmovdqa ymm1, [rsi + 8*rcx + 0x20]
    vmovdqa ymm2, [rsi + 8*rcx + 0x40]
    vmovdqa ymm3, [rsi + 8*rcx + 0x60]
    vmovntdq [rdi + rcx*8], ymm0
    vmovntdq [rdi + rcx*8 + 0x20], ymm1
    vmovntdq [rdi + rcx*8 + 0x40], ymm2
    vmovntdq [rdi + rcx*8 + 0x60], ymm3
    add rcx, 0x10
    cmp rdx, rcx
    ja avx_nt_memcpy_forward_loop_llllssss
    ret