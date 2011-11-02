; Chicken Scheme has been used.

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

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (current-milliseconds) start-time))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (newline)
  (start-prime-test n (current-milliseconds)))

(define (search-for-primes n)
  (cond ((prime? n) n)
        (else (search-for-primes (+ n 2)))))

(time (search-for-primes 10000000001 ))
