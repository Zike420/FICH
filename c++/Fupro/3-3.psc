Proceso Mayor
	Escribir"Ingrese 3 valores numericos"
	Leer A,B,C
	Si A>B Entonces
		Si A>C Entonces
			Escribir "El primer dato es el mayor (", A,")"
		SiNo
			Escribir "El tercer dato es el mayor (", C,")"
		Fin Si
	SiNo
		Si B>C Entonces
			Escribir "El segundo dato es el mayor (", B,")"
		SiNo
			Escribir "El tercer dato es el mayor (", C,")"
		Fin Si
	Fin Si
FinProceso
