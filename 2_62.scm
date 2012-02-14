(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (
         (let ((x1 (car set1)) (x2 (car set2)))
           (cond ((= x1 x2)
                  (cons x1 (union-set (cdr set1)
                                             (cdr set2))))
                 ((< x1 x2)
                  (cons x1 (union-set (cdr set1) set2)))
                 ((< x2 x1)
                  (cons x2 (union-set (cdr set2) set1))))))))

(define a (list 1 2 3 4))

(union-set a (list 3 4 5 6))
(union-set a (list 6 7))
(union-set a a)
