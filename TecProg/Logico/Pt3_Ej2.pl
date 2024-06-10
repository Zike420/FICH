contar(_,[],0).
contar(X, [X|Lista],Cant) :- contar(X, Lista, Cant2), Cant is Cant2+1.
contar(X, [X|Lista],Cant) :- contar(X, Lista, Cant).

%contar('a', ['a', 'b', 'c', 'a', 'd', 'e', 'a', 'f', 'a'], 4).
%contar('y', ['a', 'b', 'c', 'a', 'd', 'e', 'a', 'f', 'a'], 0).
