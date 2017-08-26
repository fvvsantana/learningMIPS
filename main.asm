.data
	
.text
	.globl main
	main:
		#input
		li $v0, 5
		syscall
		
		#call function
		move $a0, $v0
		jal factorial
		
		#print
		move $a0, $v0
		li $v0, 1
		syscall
		
		#exit
		li $v0, 10
		syscall
