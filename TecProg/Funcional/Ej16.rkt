(define attach-at-end (lambda (e ls) (if (null? ls) (list e) (cons (car ls) (attach-at-end e (cdr ls))))))
(define delete-attach (lambda (e ls) (if (null? ls) (list e) (if (eq? e (car ls)) (delete-attach e (cdr ls)) (cons (car ls) (delete-attach e (cdr ls)))))))
(attach-at-end 'prueba '(esto es una))
(delete-attach 'función '(creo que función funciona la))