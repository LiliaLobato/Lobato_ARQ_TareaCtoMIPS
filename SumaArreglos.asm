# Author: Lilia Lobato
# Date: Sep 05, 2018

.data
	#Valor de Arreglos
	Vector1: .word 1 2 3 4 5 6 7 8 9   	 # Vector1
.text
	# Almacena la direccion de vector 1
	lui $at, 0x00001001	#inicia en 0hex
	ori $s1, $at, 0x00000000
		
	#Carga Valores
	add $s4,$zero,$zero	#i
	add $s5,$zero,$zero	#resultado
	add $s6, $s6, 9		#tamaño arreglos
	
	#For
for:	
	jal ProductFunction
	add $s4,$s4, 0x1	#Aumento en variable i por ciclo
	bne $s4, $s6, for	#salto for
	j exit
	
ProductFunction:
	lw $t0, ($s1) 		#Loading data from memory
	add $s5, $s5, $t0	#suma de valores
	add $s1, $s1, 4		#se mueve a la siguiente localidad de memoria
	jr $ra 			#Returning to Switch Case

exit:
