Proceso Ejerc4_11
	
	Dimension emp(6,3)
	Escribir "Con arquitecto a 0 se termina de digitar"
	
	suma=0
	Para arq=1 Hasta 6 Hacer
		Para tipo=1 Hasta 3 Hacer
			emp(arq,tipo)=0
		Fin Para
	Fin Para
	
	Repetir
		Aux=0
		Escribir "Tipo de arquitecto"
		Leer arq
		Si arq<>0 Entonces
			Si arq<6 Entonces
				Escribir "Tipo de construccion"
				Leer tipo
				Escribir "m2"
				Aux=emp(arq,tipo)
				Leer emp(arq,tipo)
				Aux=emp(arq,tipo)+Aux
				emp(arq,tipo)=Aux
			Fin Si
		Fin Si
	Hasta Que arq=0

	Para arq=1 Hasta 6 Hacer
		Escribir "Arquitecto ",arq," :" "   "Sin Saltar
		Para tipo=1 Hasta 3 Hacer
			Escribir "Tipo ",tipo,":",emp(arq,tipo)," m2" " "Sin Saltar
		Fin Para
		Escribir ""
	Fin Para
	Para arq=1 Hasta 6 Hacer
		Para tipo=1 Hasta 3 Hacer
			suma=suma+emp(arq,tipo)
		Fin Para
	Fin Para
	Escribir ""
	Escribir "La empresa hizo ",Suma," m2 totales."
	
FinProceso
