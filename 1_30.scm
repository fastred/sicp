(define (cube x) (* x x x))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (simpson-coef i n)
  (cond ((= i 0) 1)
        ((= i n) 1)
        ((= (modulo i 2) 0) 2)
        ((= (modulo i 2) 1) 4)
      ))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
      dx))

(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (step x) (+ x 1))
  (define (func k)
    (define (y_k k)
      (f (+ a (* k h))))
    (cond ((or (= k 0) (= k n)) (y_k k))
          ((even? k) (* 2 (y_k k)))
          (else (* 4 (y_k k)))))
  (* (/ h 3) (sum func a step n)))

(integral-simpson cube 0 1 101)
