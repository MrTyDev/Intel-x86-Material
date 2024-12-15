

    .data
str: .asciz "Fak =%d \n"
buf: .asciz "xxxxxxxxx"
endTxt: .asciz "slut \n"

    .text
    .global main
main:
    pushq $0            # Stacken ska vara 16 bytes aligned
    movq $5, %rdi       # Beräkna 5!
    call fac            # IN=%rdi, OUT=%rax (dvs %rax=120)
    movq %rax, %rsi     # Flytta returvärdet till argumentregistret %rsi
    movq $str, %rdi     # skriv ut Fak ="resultat"
    call printf         # %rdi pekar på formatsträng "Fak =%d n", %rsi=värde

    # läs med fgets (buf,5,stdin) (C anropsformat) fgets(%rdi, %rsi, %rdx)
    movq $buf, %rdi     # lägg i buf
    movq $5, %rsi       # högst 5-1=4 tecken
    movq stdin, %rdx    # från standard input
    call fgets

    movq $buf, %rdi     # fgets(%rdi, %rsi, %rdx) --> $buf --> %rdi
    call printf         # skriv ut buffert
    movq $endTxt, %rdi   # följd av slut
    call printf
    popq %rax           # avsluta programmet
    ret

# Här finns funktionen n! (rekursiv)
# Inparameter: %rdi
# Utparameter: %rax
fac:
    cmpq $1, %rdi        # if n>1
    jle lBase           # hoppa till lBase om klar ( *1 )
    pushq %rdi          # lägg anropsvärde på stacken
    decq %rdi           # räkna ned värdet med 1
    call fac            # temp = fakultet av (n-1)
    popq %rdi           # hämta från stack
    imul %rdi, %rax     # return n*temp (%rax=%rax*%rdi)
    ret                 # Återvänd
    lBase:
    movq $1, %rax       # else return 1
    ret                 # Återvänd
