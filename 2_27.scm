(define (reverse items)
  (if (null? (cdr items))
    items
    (append (reverse (cdr items)) (list (car items)))))

(define (deep-reverse items)
  (cond  ((null? items)
          '())
         ((not (pair? (car items)))
          (append (deep-reverse (cdr items)) (list (car items))))
         (else
          (append (deep-reverse (cdr items)) (list (deep-reverse (car items)))))))

(define x (list (list 1 2) (list 3 4)))
(reverse x)

(deep-reverse x)
