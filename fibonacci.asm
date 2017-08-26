.data

.text
	.globl fibonacci
	fibonacci: #(int n)
		#trivial cases
		if: #(n < 3)
			bge $a0, 3, else
			li $v0, 1 #v0 = 1
			jr $ra #return
			j then
			
		#cases to calculate
		else:
			li $t0, 1 #a = 1
			li $t1, 1 #b = 1
			li $v0, 2 #answer = 2
			li $t2, 4 #i = 4
			while: #(i <= n)
				bgt $t2, $a0, then2
				move $t0, $t1 #a = b
				move $t1, $v0 #b = answer
				add $t3, $t0, $t1 #c = a + b
				move $v0, $t3 #answer = c
				add $t2, $t2, 1 #i++
				j while #go back
			then2:
			jr $ra #return	
		then:
		
		