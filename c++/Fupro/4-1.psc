Proceso Ejerc4_1
	
	Escribir "Cantidad a digitar"
	Leer N
	Dimension v(N)
	
	Para i=1 Hasta N Hacer
		Leer v(i)
	Fin Para
	
	Escribir v(7)
	Escribir v(23)
	Escribir v(N)
	DIVSI=0
	Para i=1 Hasta N Hacer
		Si v(i)mod 6=0 Entonces
			DIVSI=DIVSI+1
		Fin Si
	Fin Para
	
	Si DIVSI>0 Entonces
		Escribir "Son divisible por 6 ", DIVSI," numeros."
	SiNo
		Escribir "Ningun numero es divisible por 6"
	Fin Si
	
FinProceso
