	.global max 

max: 
	cmpl  %esi, %edi    # jämför y och x 
	cmovl %esi, %edi    # flytta %esi (y)till %edi om större (annars ligger x kvar i %edi)
	movl  %edi, %eax    # uppdatera returvärdet %eax
	ret
