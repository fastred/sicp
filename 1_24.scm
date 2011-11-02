; Chicken Scheme has been used.

(define (square n)
  (* n n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (remainder (square (expmod base (/ exp 2) m))
                  m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                  m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (search-for-primes n)
  (cond ((fast-prime? n 1000) n)
        (else (search-for-primes (+ n 2)))))

(time (search-for-primes 1000000001 ))
