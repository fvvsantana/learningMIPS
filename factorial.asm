.data
	m1: .asciiz "Insert n: "
	m2: .asciiz "Factorial(n): "
.text
	.globl factorial
	factorial: #(int n)
		li $t0, 2 #i = 2
		li $t1, 1 #answer = 1
		while: #(i <= n)
			bgt $t0, $a0, then
			mul $t1, $t1, $t0 #answer *= i
			add $t0, $t0, 1 #i++
			j while
		then:
		#return answer
		move $v0, $t1 
		jr $ra
		
	.globl testFactorial
	testFactorial:
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
		jal factorial
		
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
		