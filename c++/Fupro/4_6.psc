Proceso Ejerc4_6
	Escribir "Cantidad de alumnos"
	Leer N
	
	Dimension Aprob(N),Noaprob(N)
	ContAp=0; ContNoAp=0
	Escribir "Alumno y nota"
	Para Alu=1 Hasta N Hacer
		Leer Alumnos, Nota
		Si Nota>=7 Entonces
			Aprob(ContAp+1)=Alumnos
			ContAp=ContAp +1
		SiNo
			Noaprob(ContNoAp+1)=Alumnos
			ContNoAp=ContNoAp+1
		Fin Si
	Fin Para
	Escribir "Aprobados"
	Para Alu=1 Hasta ContAp Hacer
		Escribir Aprob(Alu)
	Fin Para
	Escribir "No aprobados"
	Para Alu=1 Hasta ContNoAp Hacer
		Escribir Noaprob(Alu)
	Fin Para
FinProceso
