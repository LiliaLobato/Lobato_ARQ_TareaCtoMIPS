# Author: Lilia Lobato
# Date: Sep 05, 2018
.data

.text
	#Carga Valores
	add $s0,$zero,$zero 	#Selector
	addi $s1,$s1,0x5	#a
	addi $s2,$s2,0x3	#b
	add $s3,$s3,$zero	#c
	
	beq $s0, 0x1, case1 	#Case 1
	beq $s0, 0x2, case2 	#Case 2
	beq $s0, 0x3, case3 	#Case 3
	
	#Switch Case
default:
	jal andBitwise 		#funcion andBitwise
	j exit			#break;
case1:
	jal suma 		#funcion Suma
	j exit			#break;
case2:
	jal resta 		#funcion Resta
	j exit			#break;
case3:
	jal multiplica 		#funcion multiplica
	j exit			#break;

	#Funciones
andBitwise:
	jr $ra 			#Returning to Switch Case
suma:
	jr $ra 			#Returning to Switch Case
resta:
	jr $ra 			#Returning to Switch Case
multiplica:
	jr $ra 			#Returning to Switch Case


exit:

