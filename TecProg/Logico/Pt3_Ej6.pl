suma_lista([], [], []).

suma_lista([X1|L1], [X2|L2], [X3|ListaSuma]):- X3 is X1+X2, suma_lista(L1,L2,ListaSuma).


%suma_lista([1, -2, 3, -4], [2, 3, 1, 4], ListaSuma).
