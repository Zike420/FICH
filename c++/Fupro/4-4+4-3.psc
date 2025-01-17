Proceso Ejcer4_3
	
	Dimension v(10)
	x=0
	Para i=1 Hasta 10 Hacer
		Leer v(i)
	Fin Para
	Para i=1 Hasta 10 Hacer
		Escribir v(i)
	Fin Para
	Pos=1
	Mientras v(Pos)<>"Garcia" Hacer
		Pos=Pos+1
	Fin Mientras
	
	Para i=Pos+1 Hasta 10 Hacer
		v(i-1)=v(i)
	Fin Para
	Escribir ""
	Escribir ""
	Escribir ""
	Para i=1 Hasta 9 Hacer
		Escribir v(i)
	Fin Para
	
FinProceso
