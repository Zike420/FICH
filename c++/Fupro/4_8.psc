Proceso Ejerc4_8
	
	Dimension A(8,12), B(8,12), Suma(8,12), Promedio(8,12)
	
	Para f=1 Hasta 8 Hacer
		Para c=1 Hasta 12 Hacer
			A(f,c)=azar(100)
		Fin Para
	Fin Para
	Para f=1 Hasta 8 Hacer
		Para c=1 Hasta 12 Hacer
			B(f,c)=azar(100)
		Fin Para
	Fin Para
	
	Para f=1 Hasta 8 Hacer
		Para c=1 Hasta 12 Hacer
			Escribir A(f,c),"  " Sin Saltar
		Fin Para
		Escribir ""
	Fin Para
	Escribir ""
	Escribir ""
	Para f=1 Hasta 8 Hacer
		Para c=1 Hasta 12 Hacer
			Escribir B(f,c),"  " Sin Saltar
		Fin Para
		Escribir ""
	Fin Para
	Escribir ""
	Escribir ""
	Para f=1 Hasta 8 Hacer
		Para c=1 Hasta 12 Hacer
			Suma(f,c)=A(f,c)+B(f,c)
			Promedio(f,c)=Suma(f,c)/2
		Fin Para
	Fin Para
	Para f=1 Hasta 8 Hacer
		Para c=1 Hasta 12 Hacer
			Escribir Suma(f,c),"  " Sin Saltar
		Fin Para
		Escribir ""
	Fin Para
	Escribir ""
	Escribir ""
	Para f=1 Hasta 8 Hacer
		Para c=1 Hasta 12 Hacer
			Escribir Promedio(f,c),"  " Sin Saltar
		Fin Para
		Escribir ""
	Fin Para
FinProceso
