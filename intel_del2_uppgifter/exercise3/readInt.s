	.text
	.global readInt

readInt:
	movq	$0, %rax        # Returvarde
while: # is digit
	cmpb	$'0', (%rdi)	# checka om str[?] har lagre ASCII-siffra än '0'
	jl	while_end           # (vilket innebar 'icke-siffra' -> avslutning)
	cmpb	$'9', (%rdi)    # checka om str[?] har hogre ASCII-siffra än '9'
	jg	while_end           # (vilket innebar 'icke-siffra' -> avslutning)
	# Convert ASCII to digit
	movzbq (%rdi), %r10  	# ASCII-kod till 64-bit med inledande nollor
	subq	$'0', %r10      # Drag ifran ASCII-kod '0' -> siffra som tal
	imulq	$10, %rax       # Multiplicerar med 10 på tidigare summa
	addq	%r10, %rax      # och addera ny entalssiffra
	incq	%rdi            # flytta fram till nasta tecken, str[?] 
	jmp	while         	# och fortsatt leta efter siffra eller avslut
	
while_end:
	ret
