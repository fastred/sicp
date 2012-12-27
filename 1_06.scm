(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
(define (square x) (* x x))
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (sqrt x)
  (sqrt-iter 1.0 x))
(define (average x y)
  (/ (+ x y) 2))
(sqrt 9)

; New version of sqrt-iter goes into an infinite recursion.
; We're working with an applicative-order interpreter, so all arguments
; passed to 'new-if' are evaluated during an application. This means that
; sqrt-iter could never terminate.
