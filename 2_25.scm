(define z (list 1 3 (list 5 7) 9))
(car (cdr (car (cdr (cdr z)))))

(define z1 (list (list 7)))
(car (car z1))

(define z2 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr z2))))))))))))
