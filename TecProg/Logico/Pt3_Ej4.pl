suma([],0).
suma([X|Lista],Sum):-  suma(Lista, Sum2), Sum is Sum2+X.
%suma([1, 2, 3], X).
