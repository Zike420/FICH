%a continuación voy a definir algunos functores de prueba para entender mejor las listas.

miembro(X,[X|_]). % me fijo si el elemento encabeza la lista
miembro(X,[_|R]) :- miembro(X,R). %me fijo si para la cola de la lista, el elemento encabeza la lista. Este procedimiento se repetirá hasta que la cola de la lista esté vacía.

concatenar([],L,L). %Los primeros dos parámetros son la entrada, mientras que el tercero es la lista concatenada. En este caso está diciendo que concatenar una lista vacía con
%una lista devuelve la misma lista. (sería el caso de corte de la recursión)
concatenar([X|L1],L2,[X|L3]) :- concatenar(L1,L2,L3). %Esta parte se encarga de "vaciar" L1 para llegar a la condición de corte definida arriba, básicamente toma el primer elemento
%de la primer lista y lo inserta al comienzo de L3, repitiendo recursivamente el proceso hasta que se vacíe L1.

inversa([],[]). %la inversa de una lista vacía es otra lista vacía. (condición de corte)
inversa([X|L1],Linv):- %aquí Linv es el resultado de invertir L1.
                    inversa(L1,Resto), %aquí se aplica la recursividad, invirtiendo lo que queda de L1 y agregándoselo al Resto, que es parte de la lista ya invertida.
                    concatenar(Resto,[X],Linv). %esta es la parte que se encarga de concatenar, a Resto le añade el primer elemento de L1, creando así la inversa.

% EJERCICIO 2

contar(_, [], 0). % Condición de corte, no importa cuál sea el elemento, en una lista vacía deben haber cero.
%en ambos casos, la recursión se va a basar en recorrer la cola de la lista luego de verificar si estaba o no el elemento en cuestión.
contar(Elem, [Elem|Cola], Cantidad) :- contar(Elem, Cola, CantPrevia), Cantidad is CantPrevia + 1. %si encuentro el elemento, a la suma de la cantidad anterior (CantPrevia), 
%debo sumarle 1, y este será el valor de mi Cantidad total.
contar(Elem, [X|Cola], Cantidad) :- Elem\=X, contar(Elem, Cola, Cantidad). %si no encuentro el elemento, no sumo nada, simplemente sigo con la cola de la lista.

% EJERCICIO 3

cantidad([], 0). % Una lista vacía no tiene elementos, condición de corte.
cantidad([_|Cola], Cant) :- cantidad(Cola, CantPrevia), Cant is CantPrevia + 1. %este es aún más sencillo que el anterior ya que ni siquiera me interesa el elemento que encabeza,
%simplemente sumo siempre 1 a la cantidad hasta que se acabe la lista y termine por la condición de corte.

% EJERCICIO 4

suma([], 0). % si la lista no tiene elementos, sumo cero. Condición de corte.
suma([Elem|Cola], Suma) :- suma(Cola, SumaPrevia), Suma is SumaPrevia + Elem. %igual al de arriba, en vez de contar sumo el elemento.

% EJERCICIO 5

positivos([],[]). % no hay positivos en una lista vacía, condición de corte.
positivos([Numero|Cola], [Numero|Cola2]) :- Numero>0, positivos(Cola, Cola2). %creería q el append se hace en la declaración inicial de la regla, a medida q la lista principal se achica,
%se va generando la lista de los positivos en Cola2.
positivos([Numero|Cola], ListaPositivos) :- Numero<1, positivos(Cola, ListaPositivos).

% EJERCICIO 6

suma_lista([], [], []). %la suma de dos listas vacías es una lista vacía, condición de corte.
suma_lista([Elem1|Cola1], [Elem2|Cola2], [Suma|Cola3]) :- Suma is Elem1+Elem2, suma_lista(Cola1, Cola2, Cola3). %principio similar al anterior, nada más cambia la parte de la Suma.

% EJERCICIO 7

eliminar_dup_desordenado([],[]). %condición de corte.
eliminar_dup_desordenado([Elem|Cola1],SinDup) :- miembro(Elem,Cola1), eliminar_dup_desordenado(Cola1,SinDup).
eliminar_dup_desordenado([Elem|Cola1],[Elem|Cola2]) :- \+ miembro(Elem,Cola1), eliminar_dup_desordenado(Cola1,Cola2).   % \+ es "not"

eliminar(_, [], []).
eliminar(Elem,[Elem|Cola1], NewList) :- eliminar(Elem,Cola1,NewList).
eliminar(Elem,[X|Cola1], [X|Cola2]) :- Elem\=X, eliminar(Elem,Cola1,Cola2).

eliminar_dup([],[]).
eliminar_dup([Elem|Cola1],[Elem|Cola2]) :- eliminar(Elem,Cola1,Cola2). %deja un duplicado?