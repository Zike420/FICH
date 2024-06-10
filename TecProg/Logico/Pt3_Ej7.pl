concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):-
				concatenar(L1,L2,L3).

esta(El,[El|_]).
esta(El, [_|L]) :-
		esta(El, L).

eliminar_dup([],[]).
eliminar_dup([X|L], SinDup) :-
				esta(X, L),
				eliminar_dup(L, SinDup).
eliminar_dup([X|L], SinDup) :-
				not(esta(X, L)),
				eliminar_dup(L, SinDup1),
				concatenar([X],SinDup1, SinDup).