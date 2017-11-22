global long_mode_start
extern rust_main
	
section .text
bits 64
long_mode_start:
    ; load 0 into all data segment registers
    mov ax, 0
    mov ss, ax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    ; call the rust main
    extern rust_main     
    call rust_main       
	
    ; print `OKAY` to screen
    mov rax, 0x2f612f6c2f692f6d
    mov qword [0xb8000], rax
    hlt
