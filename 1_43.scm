(define (inc x) (+ x 1))
(define (square x) (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f x)
  (define (rep-iter f a)
    (if (= a (- x 1)) f
      (compose f (rep-iter f (+ a 1)))))
  (rep-iter f 0))

((repeated square 2) 5)
((repeated square 3) 5)
((repeated inc 1) 10)
