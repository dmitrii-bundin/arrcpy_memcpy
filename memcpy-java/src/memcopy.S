section .text

extern memcpy

global avx_copy_64
global avx_copy_32_32
global avx_nt_memcpy
global avx_nt_memcpy_forward_lsls
global avx_nt_memcpy_forward_ls
global avx_nt_memcpy_forward_llss
global avx_nt_memcpy_forward_llllssss

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
avx_copy_64:
    vmovdqa ymm0, [rsi]
    vmovdqa ymm1, [rsi + 0x20]
    vmovdqa ymm2, [rsi + 0x40]
    vmovdqa ymm3, [rsi + 0x60]
    vmovdqa ymm4, [rsi + 0x80]
    vmovdqa ymm5, [rsi + 0xA0]
    vmovdqa ymm6, [rsi + 0xC0]
    vmovdqa ymm7, [rsi + 0xE0]
    vmovdqa ymm8, [rsi + 0x100]
    vmovdqa ymm9, [rsi + 0x120]
    vmovdqa ymm10, [rsi + 0x140]
    vmovdqa ymm11, [rsi + 0x160]
    vmovdqa ymm12, [rsi + 0x180]
    vmovdqa ymm13, [rsi + 0x1A0]
    vmovdqa ymm14, [rsi + 0x1C0]
    vmovdqa ymm15, [rsi + 0x1E0]
    vmovdqa [rdi + 0x1E0], ymm15
    vmovdqa [rdi + 0x1C0], ymm14
    vmovdqa [rdi + 0x1A0], ymm13
    vmovdqa [rdi + 0x180], ymm12
    vmovdqa [rdi + 0x160], ymm11
    vmovdqa [rdi + 0x140], ymm10
    vmovdqa [rdi + 0x120], ymm9
    vmovdqa [rdi + 0x100], ymm8
    vmovdqa [rdi + 0xE0], ymm7
    vmovdqa [rdi + 0xC0], ymm6
    vmovdqa [rdi + 0xA0], ymm5
    vmovdqa [rdi + 0x80], ymm4
    vmovdqa [rdi + 0x60], ymm3
    vmovdqa [rdi + 0x40], ymm2
    vmovdqa [rdi + 0x20], ymm1
    vmovdqa [rdi], ymm0
    ret

avx_copy_32_32:
    vmovdqa ymm0, [rsi]
    vmovdqa [rdi], ymm0
    vmovdqa ymm1, [rsi + 0x20]
    vmovdqa [rdi + 0x20], ymm1
    vmovdqa ymm2, [rsi + 0x40]
    vmovdqa [rdi + 0x40], ymm2
    vmovdqa ymm3, [rsi + 0x60]
    vmovdqa [rdi + 0x60], ymm3
    vmovdqa ymm4, [rsi + 0x80]
    vmovdqa [rdi + 0x80], ymm4
    vmovdqa ymm5, [rsi + 0xA0]
    vmovdqa [rdi + 0xA0], ymm5
    vmovdqa ymm6, [rsi + 0xC0]
    vmovdqa [rdi + 0xC0], ymm6
    vmovdqa ymm7, [rsi + 0xE0]
    vmovdqa [rdi + 0xE0], ymm7
    vmovdqa ymm8, [rsi + 0x100]
    vmovdqa [rdi + 0x100], ymm8
    vmovdqa ymm9, [rsi + 0x120]
    vmovdqa [rdi + 0x120], ymm9
    vmovdqa ymm10, [rsi + 0x140]
    vmovdqa [rdi + 0x140], ymm10
    vmovdqa ymm11, [rsi + 0x160]
    vmovdqa [rdi + 0x160], ymm11
    vmovdqa ymm12, [rsi + 0x180]
    vmovdqa [rdi + 0x180], ymm12
    vmovdqa ymm13, [rsi + 0x1A0]
    vmovdqa [rdi + 0x1A0], ymm13
    vmovdqa ymm14, [rsi + 0x1C0]
    vmovdqa [rdi + 0x1C0], ymm14
    vmovdqa ymm15, [rsi + 0x1E0]
    vmovdqa [rdi + 0x1E0], ymm15
    ret