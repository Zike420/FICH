factorial(0,1). %Definir siempre el corte
factorial(A,B):- 
		A>0,
		A1 is A-1,
		factorial(A1,B1), 
		B is A*B1.			

