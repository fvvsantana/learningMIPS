.data

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
		