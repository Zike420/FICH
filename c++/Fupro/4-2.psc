Proceso Ejerc4_2
	
	Dimension v(20)
	Total=0
	Escribir "Digite 20 datos"
	Para i=1 Hasta 20 Hacer
		Leer v(i)
		Total=v(i)+Total
	Fin Para
	Promedio=Total/20
	Max=0
	Para i=1 Hasta 20 Hacer
		Si v(i)>Promedio Entonces
			Max=Max+1
		Fin Si
	Fin Para
	Escribir Promedio
	Escribir Max
	
FinProceso
