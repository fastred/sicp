; Chicken Scheme has been used.

(define (square n)
  (* n n))

(define (next n)
  (if (= n 2) 3
    (+ n 2)))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (current-milliseconds) start-time))))

(define (search-for-primes n)
  (cond ((prime? n) n)
        (else (search-for-primes (+ n 2)))))

(time (search-for-primes 10000000001 ))
(time (search-for-primes 100000000001 ))
