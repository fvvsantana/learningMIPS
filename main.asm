.data
	message: .asciiz "Print: \n"
.text
	.globl main
	main:
	
		
		#exit
		li $v0, 10
		syscall
