f(a,2). %f(X,1) ES X=C
f(a,3). %f(X) ES ERROR POR VARIAS VARIABLES
f(b,2). %f(a,X) ES X=2 Y X=3
f(b,4). %f(c,1) ES TRUE
f(c,1). %f(X,Y) ES TODOS LOS VALORES
f(c,2). %f(2,a) ES FALSE
	%f(X,Y),f(X,4). ES VALORES DE b Y FALSE
