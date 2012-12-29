;This representation is possible thanks to the Fundamental theorem of arithmetic.

(define (factor-count num factor)
  (define (iter n)
    (if (= (remainder num (expt factor n)) 0)
      (iter (+ n 1))
      (- n 1)))
  (iter 1))
(define (cons a b) (* (expt 2 a) (expt 3 b)))
(define (car a) (factor-count a 2))
(define (cdr a) (factor-count a 3))

;(define a (cons 6 7))
;(car a)
;(cdr a)

