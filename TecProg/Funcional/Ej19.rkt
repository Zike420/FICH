(define pesopalabra (lambda (ls) (if (null? ls) 0 (+ (char->integer (car ls)) (pesopalabra (cdr ls))))))
(define es_menor_palabra (lambda (palabra1 palabra2) (if (<= (pesopalabra (string->list palabra1)) (pesopalabra (string->list palabra2))) true false)))
(define menor_palabra_lista (lambda (ls e) (if (null? ls) e (if (es_menor_palabra (car ls) e) (menor_palabra_lista (cdr ls) (car ls)) (menor_palabra_lista (cdr ls) e))) ))
; defino un eliminar, ya está hecho más arriba
(define ordenar_palabras (lambda (ls) (if (null? ls) ls (cons (menor_palabra_lista ls "ááááááááááá") (ordenar_palabras (eliminar (menor_palabra_lista ls "ááááááááááá") ls)) )) ))