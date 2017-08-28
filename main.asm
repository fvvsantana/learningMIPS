.data
	message: .asciiz "Print: \n"
.text
	.globl main
	main:
		jal testRFactorial
		
		#exit
		li $v0, 10
		syscall
