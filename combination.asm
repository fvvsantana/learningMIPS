.data

.text
	.globl combination
	combination: #(int n, int p)
		#saving arguments
		move $t0, $a0 #n
		move $t1, $a1 #p
		
		
		#a = n!
		jal factorial #as $a0 already is equal n:
		move $t2, $v0
		
		#b = p!
		move $a0, $t1
		jal factorial
		move $t3, $v0
		
		#c = n-p
		sub $t4, $t0, $t1
		 
		#d = (n-p)!
		move $a0, $t4
		jal factorial
		move $t5, $v0
		 
		#e = p! * (n-p)!
		mul $t6, $t3, $t5
		
		#answer = n! / (p! * (n-p)!)
		div $v0, $t2, $t6
		
		#return answer
		jr $ra