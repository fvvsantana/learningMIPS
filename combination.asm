.data

.text
	.globl combination
	combination: #(int n, int p)
		#save return address and s registers
		subi $sp, $sp, 36
		sw $ra, 0($sp)
		sw $s0, 4($sp)
		sw $s1, 8($sp)
		sw $s2, 12($sp)
		sw $s3, 16($sp)
		sw $s4, 20($sp)
		sw $s5, 24($sp)
		sw $s6, 28($sp)
		sw $s7, 32($sp)
		
		#saving arguments
		move $s0, $a0 #n
		move $s1, $a1 #p
		
		
		#a = n!
		jal factorial #as $a0 already is equal n:
		move $s2, $v0
		
		#b = p!
		move $a0, $s1
		jal factorial
		move $s3, $v0
		
		#c = n-p
		sub $s4, $s0, $s1
		 
		#d = (n-p)!
		move $a0, $s4
		jal factorial
		move $s5, $v0
		 
		#e = p! * (n-p)!
		mul $s6, $s3, $s5
		
		#answer = n! / (p! * (n-p)!)
		div $v0, $s2, $s6
		
		#load old return address and s registers
		lw $ra, 0($sp)
		lw $s0, 4($sp)
		lw $s1, 8($sp)
		lw $s2, 12($sp)
		lw $s3, 16($sp)
		lw $s4, 20($sp)
		lw $s5, 24($sp)
		lw $s6, 28($sp)
		lw $s7, 32($sp)
		addi $sp, $sp, 36
		
		#return answer
		jr $ra

	.globl testCombination
	testCombination:
		#save return address 
		subi $sp, $sp, 4
		sw $ra, 0($sp)
		
		#read input n
		li $v0, 5
		syscall
		#store n in $a0
		move $a0, $v0
		
		#read input p
		li $v0, 5
		syscall
		#store p in $a1
		move $a1, $v0
		
		#call function
		jal combination
		
		#print result
		move $a0, $v0
		li $v0, 1
		syscall
		
		#load old return address
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		 
		#return
		jr $ra
