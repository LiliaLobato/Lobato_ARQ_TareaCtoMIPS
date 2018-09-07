# Author: Lilia Lobato
# Date: Sep 5, 2018

.text
Main:
	#Variables
	add  $s0, $s0, 10	# s0 -> a
	add  $s1, $s1, 4	# s1 -> b
	add  $s2, $zero, $zero	# s2 -> result
	add  $s3, $zero, $zero	# s3 -> i
	
	jal division 		# Calling procedure
	j Exit			
			
division:
	slt $t0, $s0, $s1	# if b > a t0=0
	beq $t0, 0, continue	# if t0=0 -> continue
	and $s2, $s2, $zero	# Resultado = 0
	jr $ra
	
continue:
	j Loop
	
Loop:	
	#Guardado de retorno
	addi $sp, $sp,-8 	# Decreasing the stack pointer for 2 values
	sw $ra 4($sp) 		# Storing n
	sw $s0, 0($sp) 		# Storing the resturn address
	
	#Recursividad
	sub $s0, $s0, $s1 	# a = a - b
	jal division		# recursive function
	
	#Regresando valores de retorno
	lw $s0, 0($sp) 		# Loading values from stak
	lw $ra, 4($sp) 		# Loading values from stak
	addi $sp, $sp, 8 	# Increasing stack pointer
	
	addi $s3, $s3, 01 	# return division (a - b, b) + 1
	
	#potencia
	jr $ra  		# Return to the caller

Exit:
