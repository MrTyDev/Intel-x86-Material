.text
	.global main
main: 
	pushq $0            # för stack alignment 16 bytes
	movq $10, %rcx      # initiera %rcx till 10 (räknare)
	xorq %rax, %rax     # nollställ %rax (aktuellt tal)
	movq $1, %rbx       # initiera %rbx (nästa tal)

lPrint:
	pushq %rax         # lägg registervärde på stacken (printf förstör)
	pushq %rcx         # lägg 	registervärde på stacken (printf förstör)
	movq $format, %rdi # formatsträngens adress
	movq %rax, %rsi    # andra argumentet till %rsi (aktuellt tal)
	#xorq %rax, %rax    # nollställ %rax före printf   (ty X EXOR X = 0)
	call printf        # %rdi pekar på formatsträng ”%ld\n”, %rsi=tal
    popq %rcx          # återhämta registervärde (OBS! ordningen)
	popq %rax          # återhämta registervärde
	movq %rax, %rdx    # spara undan aktuellt tal i %rdx   
	movq %rbx, %rax    # skifta så nästa tal blir aktuellt 
	                   # %rax: 0->1, 1->1, 1->2, 2->3, 3->5,…)
	addq %rdx, %rbx    # beräkna nästa tal 
	decq %rcx          # räkna ned räknaren (40->39->38->…->0)
	jne lPrint         # om det inte blev noll beräkna ett nytt tal
	call exit

	.data
format: .asciz "%d\n"
