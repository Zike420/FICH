hombre('m1').
hombre('m2').
hombre('m3').
hombre('m4').
hombre('m5').
hombre('m6').
hombre('m7').
hombre('m8').
hombre('m9').
mujer('f1').
mujer('f2').
mujer('f3').
mujer('f4').
mujer('f5').
mujer('f6').
mujer('f7').
mujer('f8').
mujer('f9').
progenitor('m1','m5').
progenitor('f1','m5').
progenitor('m2','f6').
progenitor('m2','f7').
progenitor('f2','f6').
progenitor('f2','f7').
progenitor('f3','f5').
progenitor('m3','f5').
progenitor('m3','m4').
progenitor('f4','m4').
progenitor('m5','m7').
progenitor('m5','m6').
progenitor('f6','m7').
progenitor('f6','m6').
progenitor('m6','m8').
progenitor('f8','m8').
progenitor('m8','m9').
progenitor('f9','m9').

padre(A,B):- progenitor(A,B), hombre(A).
madre(A,B):- progenitor(A,B), mujer(A).
abuelo(A,B):- padre(X,B), progenitor(A,X), hombre(A); madre(Y,B), progenitor(A,Y), hombre(A).
abuela(A,B):- padre(X,B), progenitor(A,X), mujer(A); madre(Y,B), progenitor(A,Y), mujer(A).
hermano(A, B):- padre(P, A), padre(P, B), madre(M, A), madre(M, B), A \= B.
hermanovaron(A, B):- padre(P, A), padre(P, B), madre(M, A), madre(M, B), hombre(A), A \= B.
hermanomujer(A, B):- padre(P, A), padre(P, B), madre(M, A), madre(M, B), mujer(A), A \= B.
sucesor(A,B):- progenitor(B,A); abuelo(B,A); abuela(B,A); abuelo(Z,A), progenitor(B,Z); abuela(Z,A), progenitor(B,Z). .

es_madre(A):- mujer(A), progenitor(A,X).
es_padre(A):- hombre(A), progenitor(A,X).
tia(A,B):- mujer(A), progenitor(X,B), hermano(X,A).
yerno(A,B):- hombre(A), progenitor(A,X), progenitor(X,Y), progenitor(B,Y).
nuera(A,B):- mujer(A), progenitor(A,X), progenitor(X,Y), progenitor(B,Y).
