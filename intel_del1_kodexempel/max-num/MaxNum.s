	.text
	.global MaxNum
MaxNum:
	movl	(%rdi), %eax
LOOP:
	addq	$4,%rdi
	cmpl	%eax, (%rdi)
	jl	LABEL
	movl	(%rdi), %eax
LABEL:
	decq	%rsi
	cmpq	$1, %rsi
	jg	LOOP
	ret
	
