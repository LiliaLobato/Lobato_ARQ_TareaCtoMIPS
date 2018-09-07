# Author: Lilia Lobato
# Date: Sep 05, 2018

.data
	#Valor de Arreglos
	Vector1: .word 1 2 3 4 5 6 7 8 9   	 # Vector1
	Vector2: .word -1 2 -3 4 -5 6 -7 8 -9    # Vector2
.text
	# Almacena la direccion de cada Arreglo
	la $s1, Vector1
	la $s2, Vector2
	
	#Carga Valores
	add $s4,$zero,$zero	#i
	add $s5,$zero,$zero	#resultado
	
	#For
for:	
	jal ProductFunction
	add $s5, $s5,$s6	#Se suman las multiplicaciones
	add $s6, $zero, $zero	#se limpia la variable de la multiplicacion
	add $s4,$s4, 0x1	#Aumento en variable i por ciclo
	bne $s4, 0x9, for	#salto for
	j exit
	
ProductFunction:
	lw $t0, ($s1) 		#Loading data from memory
	lw $t1, ($s2) 		#Loading data from memory
	mul $s6, $t0, $t1	#multiplicamos los valores de memoria
	add $s1, $s1, 4		#se mueve a la siguiente localidad de memoria
	add $s2, $s2, 4		#se mueve a la siguiente localidad de memoria
	jr $ra 			#Returning to Switch Case

exit:
