hombre('Livio').
hombre('Pedro').

mujer('Hayd�e').
mujer('Tania').

ingeniero('Hayd�e').
medico('Tania').
contador('Livio').
abogado('Pedro').
abogado('Hayd�e').

libro(['Rayuela', 'novela', 'largo']).
libro(['Karamazov', 'novela', 'largo']).
libro(['Octaedro', 'cuento', 'corto']).
libro(['Inventario', 'poema', 'largo']).
libro(['Leones', 'novela', 'corto']).

gusta('Livio','Rayuela').
gusta('Pedro','Octaedro').

gusta(A,B):- abogado(A), libro([B,'novela','larga']); medico(A), libro([B,'novela',Z]); ingeniero(A), libro([B,'novela',Z]); mujer(A), libro([B,Y,'largo']); contador(A), hombre(A), libro([B,'cuento',Z]);
		 contador(A), hombre(A), libro([B,'poema',Z]).