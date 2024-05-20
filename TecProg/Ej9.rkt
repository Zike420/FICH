(define distance2d (lambda (x y)  (sqrt (+ (expt (- (car y) (car x)) 2) (expt (- (car y) (car x)) 2)))))

(distance2d '(1 . 1) '(2 . 2))