cantidad([],0).
cantidad([_|Lista],Elementos) :- cantidad(Lista, Elementos2), Elementos is Elementos2+1.
cantidad([X|Lista],Elementos) :- cantidad(Lista, Elementos).