(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (x)
                     (if (pair? x) (count-leaves x)
                            1))
                   t)))


(define x (list (list 1 2) (list 3 4)))
(length (list x x))

(count-leaves (list x x))
