(define (average x y)
  (/ (+ x y) 2))

(define (iterative-improve good-enough? improve)
  (lambda (first-guess)
    (define (iter guess)
      (let ((next (improve guess)))
        (if (good-enough? guess next)
          guess
          (iter next))))
    (iter first-guess)))

(define (sqrt x)
  (define (good-enough? guess next)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (exact->inexact ((iterative-improve good-enough? improve) x)))

(define (fixed-point f first-guess)
  (define (good-enough? guess next)
    (< (abs (- guess next)) 0.00001))
  ((iterative-improve good-enough? f) first-guess))

;(sqrt 2)
;(sqrt 3)
;(fixed-point cos 1.0)
;(fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0)
