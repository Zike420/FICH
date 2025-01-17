Proceso Ejerc_5
	N=10
	Dimension v(N+1)
	
	Para Apellido=1 Hasta N Hacer
		Leer v(Apellido)
	Fin Para
	
	Leer Ape
	Leer Pos
	
	Para Apellido=N Hasta Pos Con Paso -1 Hacer
		v(Apellido+1)=v(Apellido)
	Fin Para
	v(Pos)=Ape
	N=N+1
	Para Apellido=1 Hasta N Hacer
		Escribir v(Apellido)
	Fin Para
FinProceso
