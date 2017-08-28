.data
	m1: .asciiz "Insert n: "
	m2: .asciiz "rFactorial(n): "
.text
	.globl rFactorial
	rFactorial: #(int n)
		#save return address and argument n
		sub $sp, $sp, 8
		sw $ra, 0($sp)
		sw $a0, 4($sp) #n
		
		#if(n < 2) #return 1
			li $v0, 1
			blt $a0, 2, factorialDone
		#then:
		
		#calculate rFactorial(n-1)
		sub $a0, $a0, 1 #$a0--
		jal rFactorial
		
		#calculate n * rFactorial(n-1)
		lw $t0, 4($sp) #$t0 = n
		mul $v0, $t0, $v0 #$v0 = n * rFactorial(n-1)
		
		factorialDone:
			#restore stack and load $ra
			lw $ra, 0($sp)
			add $sp, $sp, 8
			jr $ra #return $v0
		
	.globl testRFactorial
	testRFactorial:
		#save return address 
		sub $sp, $sp, 4
		sw $ra, 0($sp)
		
		#request for input n
		li $v0, 4
		la $a0, m1
		syscall
		#read input n
		li $v0, 5
		syscall
		#callfunction
		move $a0, $v0
		jal rFactorial
		
		#print m2
		move $t0, $v0 #t0 = answer
		li $v0, 4
		la $a0, m2
		syscall
		#print result
		move $a0, $t0 #$a0 = t0
		li $v0, 1
		syscall
		
		#load old return address
		lw $ra, 0($sp)
		add $sp, $sp, 4
		 
		#return
		jr $ra
		