(define (equal? a b)
  (cond ((or (not (pair? a)) (not (pair? b))) (eq? a b))
        (else (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))))

(equal? 'x 'x)

(equal? '(this is a list) '(this (is a) list))
(equal? '(this (is a) list) '(this (is a) list))
