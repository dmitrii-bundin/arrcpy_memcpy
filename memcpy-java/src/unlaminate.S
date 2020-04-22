section .text

global test_tag_hit
global test_bubble_slots
global unl_store_op_base_idx_disp
global unl_store_op_base_idx_disp2
global unl_store_op_base_disp
global unl_load_op_base_idx_disp

; align 64
; unlaminate_store_op_base_idx_disp:
;     mov rdi, [rsi + rdx * 4 + 0x40]
;     dec rcx
;     ja unlaminate_store_op_base_idx_disp
;     ret

test_tag_hit:
    dec rdi
    ja test_tag_hit
    ret

align 32
test_bubble_slots:
    nop
    nop
    jmp test_bubble_slots_dec
    nop dword [eax + 1 * eax + 0x12345678]
    nop dword [eax + 1 * eax + 0x12345678]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
test_bubble_slots_dec:
    nop
    nop
;     nop
;     nop
;     nop
;     jmp test_bubble_slots_dec_2
; align 32
; test_bubble_slots_dec_2:
;     nop
;     nop
;     nop
;     jmp test_bubble_slots_dec_3
; align 32
; test_bubble_slots_dec_3
;     nop
;     nop
;     nop
;     jmp test_bubble_slots_dec_another_line
; align 32
; test_bubble_slots_dec_another_line:
;     nop
;     nop
;     nop
    dec rdi
    jnz test_bubble_slots
    ret

unl_store_op_base_idx_disp:
    ; mov [rdi + rdx * 4 + 0x40], rsi 
    nop ax
    dec rcx
    ja unl_store_op_base_idx_disp
    ret

unl_store_op_base_idx_disp2:
    ; mov [rdi + rdx * 4 + 0x40], rsi 
    nop ax
    dec rcx
    ja unl_store_op_base_idx_disp2
    ret

unl_store_op_base_disp:
    mov [rdi + 0x80], rsi 
    dec rdx
    ja unl_store_op_base_disp
    ret

unl_load_op_base_idx_disp:
    mov rdi, [rsi + rdx * 4 + 0x40]
    dec rcx
    ja unl_load_op_base_idx_disp
    ret