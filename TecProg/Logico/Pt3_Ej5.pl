positivos([], []).
positivos([X|L1], [X|ListaPos]):- X>=0, positivos(L1,ListaPos).
positivos([_|L1], ListaPos1):- positivos(L1,ListaPos1).


%positivos([1, -2, 3, -4], ListaPositivos).
