	.global maxNum

maxNum:
	movl (%rdi), %eax	# Start: vect[0] läggs i %eaxl (nuv. tal)
lLoop:
	addq $4, %rdi		# Flytta pekaren (%rdi) till nästa element i vect[]
                    		# dvs -> vect[1] -> vect[2] -> vect[3] -> vect[4] 
	cmpl %eax, (%rdi)	# Jämför nuv. tal med nästa element i vect[]
	jl lLabel				# Om nuv. tal > nästa element, hoppa till lLabel
	movl (%rdi), %eax	# annars uppdatera returvärde med största hittills
lLabel:
	decl %esi			# minska %esi 5 -> 4 -> 3 -> 2 -> 1 
	cmpl $1, %esi		# 
	jg lLoop			# Färdig? dvs %esi=1?
	ret

