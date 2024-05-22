padre(leoncio, alberto). %a)padre(alberto,luis) es true
padre(leoncio, geronimo). %b)padre(luis,alberto) es false
padre(alberto, juan). %c) hermano(luis,B) es Juan
padre(alberto, luis). %d) nieto(A,luis) es leoncio
padre(geronimo, luisa). %e) nieto(A,B)
hermano(A, B) :- padre(P, A), padre(P, B), A \= B.
nieto(A, B) :- padre(A, P), padre(P, B).
