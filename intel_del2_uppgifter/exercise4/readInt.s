	.text
	.global readInt

readInt:
	movq	$0, %rax        # Returvarde
	movq	$0, %r11        # Teckenindikator (0 = positivt tal)
lBlancCheck:
	cmpb	$' ', (%rdi)    # str[?]=blank?
	jne	lSignPlus       	# om inte blank -> checka om tecken (dvs '+','-',siffra)
	incq	%rdi            # om blank      -> flytta fram till nasta tecken, str[?]
	jmp	lBlancCheck
lSignPlus:
	cmpb	$'+', (%rdi)    # str[?]='+'?
	jne	lSignMinus      	# om inte '+'   -> checka om '-'
	incq	%rdi           	# om '+'        -> flytta fram till nasta tecken, str[?]
	jmp	lNumber         	#                  och leta efter siffror
lSignMinus:
	cmpb	$'-', (%rdi)    # str[?]='-'?
	jne	lNumber         	# om inte '-'   -> checka om siffor
	movq	$1, %r11        # Hall reda på att talet är negativt (endast om '-')
 	incq	%rdi            # flytta fram till nasta tecken, str[?] och leta siffror
lNumber:
	cmpb	$'0', (%rdi)    # checka om str[?] har lagre ASCII-siffra än '0'
	jl	lNAN            	# (vilket innebar 'icke-siffra' -> avslutning)
	cmpb	$'9', (%rdi)    # checka om str[?] har hogre ASCII-siffra än '9'
	jg	lNAN            	# (vilket innebar 'icke-siffra' -> avslutning)
	movzbq (%rdi), %r10  	# ASCII-kod till 64-bit med inledande nollor
	subq	$'0', %r10      # Drag ifran ASCII-kod för '0' -> finns siffra som tal
	imulq	$10, %rax       # Multiplicerar med 10 på tidigare summa
	addq	%r10, %rax      # och addera ny entalssiffra
	incq	%rdi            # flytta fram till nasta tecken, str[?] 
	jmp	lNumber         	# och fortsätt leta efter siffra eller avslut
lNAN:
	cmpq	$1, %r11        # Minustecken?
	jne	lEnd            	# om inte minustecken -> klar
	negq	%rax            # om minustecken -> byt tecken så det blir minus
lEnd:
	ret
