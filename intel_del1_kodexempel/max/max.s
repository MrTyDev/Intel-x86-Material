	.text 
	.global MaxOfThree 
MaxOfThree: 
	cmpl  %esi, %edi #jämför argument 1 och 2 
	cmovl %esi, %edi #flytta %esi-värdet till %edi om större 
	cmpl  %edx, %edi #jämför med argument 3 
	cmovl %edx, %edi #flytta %edx-värdet till %edi om större 
	movl  %edi, %eax #lägg returvärdet i %eax 
ret 
