(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
      (sum term (next a) next b))))

(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a) (accumulate-rec combiner null-value term (next a) next b))))

(define (product term a next b)
  (define (func x y) (* x y))
  ;(display (func 2 3))
  (accumulate func 1 term a next b))

(define (sum term a next b)
  (define (func x y) (+ x y))
  (accumulate func 0 term a next b))


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

(calculate-pi 1)
