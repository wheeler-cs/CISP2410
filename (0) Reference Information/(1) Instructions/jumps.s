# Information regarding the several types of jump commands.
# Author: amwheeler1
# Register Usage:
#	rax, rbx: General-use registers

.data
	num1: .quad 0


.text
.global main
main:

	movq $5, %rax
	movq $7, %rbx

	# cmp must first be used to set the flag register for how the two values relate
	cmp %rax, %rbx		# rbx ~ rax
	# the second operand will be used as the left-handed variable in any logical comparison

	# all jump commands follow the same format of [jumpType] [labelToJumpTo]

	# je (jump if equal)
	je equalNum			# rbx == rax

	# jne (jump if not equal)
	jne notEqual		# rbx != rax

	# jg (jump if greater than)
	jg greaterThan		# rbx > rax

	# jl (jump if less than)
	jl lessThan			# rbx < rax

	# jge (jump if greater than or equal)
	jge greaterEqual	# rbx >= rax

	# jle (jump if less than or equal)
	jle lessEqual		# rbx <= rax

	# jmp (unconditional jump)
	jmp quit			# jump to quit


equalNum:
	incq %rax			# rax++
	jmp quit

notEqual:
	decq %rax			# rax--
	jmp quit

greaterThan:
	movq %rax, %rbx		# rbx = rax
	jmp quit

lessThan:
	movq %rbx, %rax		# rax = rbx
	jmp quit

greaterEqual:
	movq $5, %rax		# rax = 5
	jmp quit

lessEqual:
	movq $5, %rbx		# rbx = 5
	jmp quit

quit:
	movq $1, %rax		# rax = 1
	movq $0, %rbx		# rbx = 0
	int $0x80			# system interrupt 0x80
	retq				# return