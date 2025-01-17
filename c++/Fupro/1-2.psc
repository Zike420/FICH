Proceso Universidad
	Escribir"Cantidad de alumnos a ingresar"
	Leer Alum
	n=0
	MT=0
	FT=0
	M=1
	AlturaTotal=0
	EdadTotal=0
	Alumnos=0
	Mientras n<Alum Hacer
		n=n+1
		Escribir "Datos del estudiante. Nombre, apellido, edad, sexo(M=1 o F=0) y altura"
		Leer Nombre, Apellido, Edad, Sexo, Altura
		AlturaTotal=Altura+AlturaTotal
		EdadTotal=Edad+EdadTotal
		Alumnos=Alumnos+1
		Si Sexo=M Entonces
			MT=MT+1
		SiNo
			FT=FT+1
		Fin Si
	Fin Mientras
	PromedioAltura=AlturaTotal/Alumnos
	PromedioEdad=EdadTotal/Alumnos
	Escribir"El promedio de altura es de ",PromedioAltura," y el de edad es de ",PromedioEdad,". La cantidad de varones es de ", MT," y de mujeres es de ",FT,"."
	
FinProceso
