section .text

extern memcpy

global erms_copy
global avx_copy_64
global avx_copy_32_32
global avx_nt_memcpy
global avx_nt_memcpy_forward_lsls
global avx_nt_memcpy_forward_ls
global avx_nt_memcpy_forward_llss
global avx_nt_memcpy_forward_llllssss
global avx_memcpy_forward_lsls
global avx_memcpy_forward_llss
global avx_memcpy_forward_ls
global avx_memcpy_forward_ls_noindex
global avx_memcpy_baseline
global gpi_memcopy

;Function implementation here follows x86_64 SYSV ABI
;rdi -- dest
;rsi -- src
;rdx -- size

erms_copy:
    mov rcx, rdx
    rep movsb
    ret

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

avx_nt_memcpy_forward_ls:
    shr rdx, 0x3
    xor rcx, rcx
avx_nt_memcpy_forward_loop_ls:
    vmovdqa ymm0, [rsi + 8*rcx]
    vmovntdq [rdi + rcx*8], ymm0
    add rcx, 0x04
    cmp rdx, rcx
    ja avx_nt_memcpy_forward_loop_ls
    ret

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

avx_memcpy_forward_llss:
    shr rdx, 0x3
    xor rcx, rcx
avx_memcpy_forward_loop_llss:
    ; vmovdqa ymm0, [rsi + 8*rcx]
    ; vmovdqa ymm1, [rsi + 8*rcx + 0x20]
    vmovdqa [rdi + rcx*8], ymm0
    vmovdqa [rdi + rcx*8 + 0x20], ymm1
    add rcx, 0x08
    cmp rdx, rcx
    ja avx_memcpy_forward_loop_llss
    ret

avx_memcpy_forward_ls:
    shr rdx, 0x3
    xor rcx, rcx
avx_memcpy_forward_loop_ls:
    vmovdqa ymm0, [rsi + 8*rcx]
    vmovdqa [rdi + rcx*8], ymm0
    add rcx, 0x04
    cmp rdx, rcx
    ja avx_memcpy_forward_loop_ls
    ret

avx_memcpy_forward_ls_noindex:
    add rdx, rsi
avx_memcpy_forward_ls_noindex_loop:
    vmovdqa ymm0, [rsi]
    add rsi, 0x20
    vmovdqa [rdi], ymm0
    add rdi, 0x20
    cmp rdx, rsi
    ja avx_memcpy_forward_ls_noindex_loop
    ret


avx_memcpy_baseline:
    shr rdx, 0x3
    xor rcx, rcx
avx_memcpy_baseline_loop:
    add rcx, 0x08
    cmp rdx, rcx
    ja avx_memcpy_baseline_loop
    ret

gpi_memcopy:
    shr rdx, 0x3
    xor rcx, rcx
gpi_memcopy_loop:
    mov r10, [rsi + 8 * rcx]
    mov r11, [rsi + 8 * rcx + 0x08]
    mov [rdi + rcx * 8], r10
    mov [rdi + rcx * 8 + 0x08], r11
    add rcx, 0x02
    cmp rdx, rcx
    ja gpi_memcopy_loop
    ret