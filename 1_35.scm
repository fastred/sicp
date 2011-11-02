(define (average x1 x2) (/ (+ x1 x2) 2))

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

(define (sqrt x)
(fixed-point (lambda (y) (y (/ x y)))
            1.0))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
