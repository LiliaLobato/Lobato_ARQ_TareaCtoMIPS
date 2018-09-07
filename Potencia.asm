# Author: Lilia Lobato
# Date: Sep 5, 2018

.text
Main:
	and $s0, $s0, $zero 
	ori $s0, $s0, 6		# s0 -> n
	and $s1, $s1, $zero 
	ori $s1, $s1, 6		# s1 -> m
	add  $s3, $zero, $zero	# s3 -> resultado
	jal Potencia 		# Calling procedure
	j Exit			
			
Potencia:
	bne $s0, $zero, continue# if n < 1
	ori $s3, $s3, 1 	# return potencia 1
	j Exit
	
continue:
	slti $t0, $s0, 2	#t0 indica si n ya llegó a 0 (to = 0, s0/=0)
	beq $t0, $zero, else	#si t0 aun no es cero, continua
	mul $s3, $s1, 1		#t0=1, resultado = m*1
	jr $ra
else:
	j Loop
Loop:	
	#Guardado de retorno
	add $sp, $sp,-8 	# Decreasing the stack pointer for 2 values
	sw $ra 4($sp) 		# Storing n
	sw $s0, 0($sp) 		# Storing the resturn address
	
	#Recursividad
	add $s0, $s0, -1 	# Decreasing n
	jal Potencia		# recursive function
	
	#Regresando valores de retorno
	lw $s0, 0($sp) 		# Loading values from stak
	lw $ra, 4($sp) 		# Loading values from stak
	add $sp, $sp, 8 	# Increasing stack pointer
	
	mul $s3, $s3, $s1	#resultado = resultado*m
	
	#potencia
	jr $ra  		# Return to the caller

Exit:
	
