(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n)
  (define (inc x) (+ x 1))
  (define (func x) x)
  (product func 1 inc n))

(define (ceiled-even n)
  (if (even? n) n
    (+ n 1)))

(define (ceiled-odd n)
  (if (even? n) (- n 1)
    n))

(define (calculate-pi n)
  (define (inc x) (+ x 1))
  (define numerator (product ceiled-even 2 inc (+ 2 n)))
  (define denominator (product ceiled-odd 3 inc (+ 3 n)))
  (* 4 (/ numerator denominator)))

(calculate-pi 160)
