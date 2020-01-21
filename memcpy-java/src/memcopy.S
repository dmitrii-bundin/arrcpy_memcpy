section .text

global avx_copy_64
global avx_copy_32_32
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

avx_copy_64:
    vmovdqa ymm0, [rdi]
    vmovdqa ymm1, [rdi + 0x20]
    vmovdqa ymm2, [rdi + 0x40]
    vmovdqa ymm3, [rdi + 0x60]
    vmovdqa ymm4, [rdi + 0x80]
    vmovdqa ymm5, [rdi + 0xA0]
    vmovdqa ymm6, [rdi + 0xC0]
    vmovdqa ymm7, [rdi + 0xE0]
    vmovdqa ymm8, [rdi + 0x100]
    vmovdqa ymm9, [rdi + 0x120]
    vmovdqa ymm10, [rdi + 0x140]
    vmovdqa ymm11, [rdi + 0x160]
    vmovdqa ymm12, [rdi + 0x180]
    vmovdqa ymm13, [rdi + 0x1A0]
    vmovdqa ymm14, [rdi + 0x1C0]
    vmovdqa ymm15, [rdi + 0x1E0]
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
    vmovdqa ymm0, [rdi]
    vmovdqa [rdi], ymm0
    vmovdqa ymm1, [rdi + 0x20]
    vmovdqa [rdi + 0x20], ymm1
    vmovdqa ymm2, [rdi + 0x40]
    vmovdqa [rdi + 0x40], ymm2
    vmovdqa ymm3, [rdi + 0x60]
    vmovdqa [rdi + 0x60], ymm3
    vmovdqa ymm4, [rdi + 0x80]
    vmovdqa [rdi + 0x80], ymm4
    vmovdqa ymm5, [rdi + 0xA0]
    vmovdqa [rdi + 0xA0], ymm5
    vmovdqa ymm6, [rdi + 0xC0]
    vmovdqa [rdi + 0xC0], ymm6
    vmovdqa ymm7, [rdi + 0xE0]
    vmovdqa [rdi + 0xE0], ymm7
    vmovdqa ymm8, [rdi + 0x100]
    vmovdqa [rdi + 0x100], ymm8
    vmovdqa ymm9, [rdi + 0x120]
    vmovdqa [rdi + 0x120], ymm9
    vmovdqa ymm10, [rdi + 0x140]
    vmovdqa [rdi + 0x140], ymm10
    vmovdqa ymm11, [rdi + 0x160]
    vmovdqa [rdi + 0x160], ymm11
    vmovdqa ymm12, [rdi + 0x180]
    vmovdqa [rdi + 0x180], ymm12
    vmovdqa ymm13, [rdi + 0x1A0]
    vmovdqa [rdi + 0x1A0], ymm13
    vmovdqa ymm14, [rdi + 0x1C0]
    vmovdqa [rdi + 0x1C0], ymm14
    vmovdqa ymm15, [rdi + 0x1E0]
    vmovdqa [rdi + 0x1E0], ymm15
    ret