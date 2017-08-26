.data
	
.text
	.globl main
	main:
		
		#read input
		li $v0, 5
		syscall
		
		#call fibonacci()
		move $a0, $v0
		jal fibonacci
		
		#print answer
		move $a0, $v0
		li $v0, 1
		syscall
		
		#exit
		li $v0, 10
		syscall