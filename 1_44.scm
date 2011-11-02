(define (square x) (* x x))

(define dx 0.1)
(define pi 3.14159265)

(define (smooth f)
  (lambda (x) 
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f x)
  (define (rep-iter f a)
    (if (= a (- x 1)) f
      (compose f (rep-iter f (+ a 1)))))
  (rep-iter f 0))

(sin (/ pi 2))

((smooth sin) (/ pi 2))

(((repeated smooth 2) sin) (/ pi 3))
