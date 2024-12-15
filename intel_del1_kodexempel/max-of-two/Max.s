	.text
	.global Max
Max:
	cmpl	%esi, %edi	#jämför argument 1 och 2
	cmovl	%esi, %edi	#flytta %esi-värdet till %edi om det var större
	movl	%edi, %eax	#lägg returvärdet i %eax
	ret
