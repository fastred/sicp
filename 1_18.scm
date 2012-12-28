(define (double a) (+ a a))
(define (halve a) (/ a 2))
(define (iterative-mul a b)
  (define (mul a b sum)
    (cond ((= b 0) sum)
          ((even? b) (mul (double a) (halve b) sum))
          (else (mul a (- b 1) (+ sum a)))))
  (mul a b 0))

; It's analogous to 1_16.
