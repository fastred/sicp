(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
(define (square x) (* x x))
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
; Inaccuracy examples:
;(sqrt 0.0001) 
;(sqrt 9999999999999999999999999999999)

(define (good-enough? new-guess guess)
  (let ((change (abs (- new-guess guess))))
    (< change 0.001)))
(define (sqrt-iter guess x)
  (let ((new-guess (improve guess x)))
    (if (good-enough? new-guess guess)
      guess
      (sqrt-iter new-guess x))))
(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 0.0001)
(sqrt 9999999999999999999999999999999)
; New method works better for the above examples.
