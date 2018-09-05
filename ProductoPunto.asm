# Author: Lilia Lobato
# Date: Sep 05, 2018

.data
	#Valor de Arreglos
	Vector1: .word 1 2 3 4 5 6 7 8 9    # Vector1
	Vector2: .word -1 2 -3 4 -5 6 -7 8 -9    # Vector1
.text
	# Almacena la direccion de cada Arreglo
	la $s1, Vector1
	la $s2, Vector2
	
	#Carga Valores
	add $s4,$zero,$zero	#i
	add $s5,$zero,$zero	#resultado
	
	#For
for:	
	#instruciones
	addi $s4,$s4, 0x1	#Aumento en variable i por ciclo
	bne $s4, 0x8, for	#salto for

exit: