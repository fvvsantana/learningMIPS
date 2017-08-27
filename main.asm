.data
	message: .asciiz "Print: \n"
.text
	.globl main
	main:
		jal testCombination
		
		#exit
		li $v0, 10
		syscall
