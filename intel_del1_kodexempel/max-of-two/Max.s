	.text
	.global Max
Max:
	cmpl	%esi, %edi	#j�mf�r argument 1 och 2
	cmovl	%esi, %edi	#flytta %esi-v�rdet till %edi om det var st�rre
	movl	%edi, %eax	#l�gg returv�rdet i %eax
	ret
