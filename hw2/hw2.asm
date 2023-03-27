.data    
	space: .asciiz " "

.text

    main:
        li $v0, 5
		syscall
		move $s0, $v0

        move $a0, $s0
        addi $a1, $zero, 2
        jal divideTillPossible
        move $s0, $v1

        addi $a0, $zero, 10
        jal sqrt

        addi $t9, $zero, 3
        move $t8, $v1
        while: 
            bgt $t9, $8, exit
            
            move $a0, $s0
            move $a1, $t9
            jal divideTillPossible
            move $s0, $v1
            addi $t9, $t9, 1
            j while

        exit:
            bgt $s0, 2, printNum

        printNum:
            li $v0, 1
            move $a0, $s0
            syscall


	    li $v0, 10
    	syscall


    divideTillPossible:
        move $t0, $a0
    	move $t1, $a1
	    move $t9, $ra
        whileDiv:
            
            add $a0, $zero, $t0
	        add $a1, $zero, $t1
            jal remainder
            add $t2, $zero, $v1

            bne $t2, $zero, exitDiv
            div $t0, $t0, $t1

            li $v0, 1
            move $a0, $t1
            syscall

            li $v0,4
    		la $a0, space
    		syscall

            j whileDiv

        exitDiv:
            move $v1, $t0
    	    jr $t9


    remainder:
    	move $t3, $a0
    	move $t4, $a1

    	div $t5, $t3, $t4
		mul $t6, $t5, $t4
		sub $v1, $t3, $t6
		
		jr $ra

    sqrt:
        move $t0, $a0
        addi $t1, $zero, 1

        whileSqrt:
            mul $t2, $t1, $t1
            bgt $t2, $t0, exitSqrt
            addi $t1, $t1, 1
            j whileSqrt
        
        exitSqrt:
            subi $t1, $t1, 1
            move $v1, $t1
    	    jr $ra

    
#cpp

##include <iostream>
##include <cmath>
#
#using namespace std;
# 
#int divideTillPossible(int n, int d){
#    while (n % d == 0)
#        {
#            cout << d << " ";
#            n = n/d;
#        }
#    return n;
#}
#
#int main()
#{
#    int n = 16;
#
#    n = divideTillPossible(n,2);
#    for (int i = 3; i <= sqrt(n); i = i + 2)
#    {
#        n = divideTillPossible(n,i);
#    }
#
#    if (n > 2)
#        cout << n << " ";
#    return 0;
#}