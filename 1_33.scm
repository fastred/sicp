(define (filtered-accumulate combiner null-value term a next b fltr)
  (define (iter a result)
    (if (> a b)
      result
      (if (fltr a)
        (iter (next a) (combiner result (term a)))
        (iter (next a) result))))
  (iter a null-value))

(define (square n)
  (* n n))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (inc x) (+ x 1))

(define (id x) x)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (sum-of-primes a b)
  (filtered-accumulate + 0 square a inc b prime?))

(define (product-of-relatively-prime n)
  (define (relatively-prime? a) (= (gcd a n) 1))
  (filtered-accumulate * 1 id 1 inc (- n 1) relatively-prime?))
