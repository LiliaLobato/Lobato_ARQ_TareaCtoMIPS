# Author: Lilia Lobato
# Date: Sep 5, 2018

.text
Main:
	jal Potencia 	# Calling procedure
	j Exit		# Jump to Main label
	
Potencia:
	slti $t0, $a0, 1 	# if n < 1
	beq $t0, $zero, Loop 	# Branch to Loop
	addi $v0, $zero, 1 	# return 1
	jr $ra 			# Return to the caller	
Loop:	
	#Guardado de retorno
	addi $sp, $sp,-8 	# Decreasing the stack pointer for 2 values
	sw $ra 4($sp) 		# Storing n
	sw $a0, 0($sp) 		# Storing the resturn address
	
	jal Factorial		# recursive function
	lw $a0, 0($sp) 		# Loading values from stak
	lw $ra, 4($sp) 		# Loading values from stak
	addi $sp, $sp, 8 	# Increasing stack pointer
	jr $ra  		# Return to the caller
Exit:
	
