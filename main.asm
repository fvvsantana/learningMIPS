.data
	message: .asciiz "Print: \n"
.text
	.globl main
	main:
		jal testFactorial
		
		#exit
		li $v0, 10
		syscall
