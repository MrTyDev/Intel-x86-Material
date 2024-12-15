.data
format: .asciz "%s"
string: .asciz "Hello world!\n"

text_copy: .space 64

.text
    .global main
main:
    # Stack alignment 16-bytes
    pushq $0

    # Bara format string
    leaq string, %rdi
    call printf


    # 2 params: Format + string
    leaq format, %rdi
    leaq string, %rsi
    call printf

    # Substring...
    leaq format, %rdi
    leaq string, %rsi
    addq $1, %rsi
    call printf


    # copy text
    leaq string, %rsi
    leaq text_copy, %rdi
copy:
    movb (%rsi), %al
    cmpb $0, %al
    je copy_end
    movb %al, (%rdi)
    incq %rsi
    incq %rdi
    jmp copy

copy_end:
    leaq format, %rdi
    leaq text_copy, %rsi
    call printf


    call exit

