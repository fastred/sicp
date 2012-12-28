(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;normal-order evaluation (assuming we're working with an interpreter using
;lazy evaluation with memoization):
;(gcd 206 40)
;(gcd 40 (remainder 206 40))
;(gcd 6 (remainder 40 6))
;(gcd 4 (remainder 6 4))
;(gcd 2 (remainder 4 2))
;remainder is called four times

;applicative-order evaluation
;(gcd 206 40)
;(gcd 40 6)
;(gcd 6 4)
;(gcd 4 2)
;(gcd 2 0)
;remainder is called five times
