; After some experiments I've found that the number of required damps is equal
; to log2(exponent).

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f x)
  (define (rep-iter f a)
    (if (= a (- x 1)) f
      (compose f (rep-iter f (+ a 1)))))
  (rep-iter f 0))
(define (average a b) (/ (+ a b) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))
(define (log2 x)
  (/ (log x) (log 2)))
(define (nth-root x n)
  (if (= n 1)
    x
    (fixed-point ((repeated average-damp (floor (log2 n)))
                  (lambda (y) (/ x (expt y (- n 1)))))
                 1.0)))

