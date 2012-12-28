(define (square x) (* x x))
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (* 2 p q) (square q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

;After algebraic manipulations (I won't copy them here) we get to the equation:
;bp' + aq' = p(bp + aq) + q(bq + aq + ap)
          ;= bpp + aqp + bqq + aqq + apq
          ;= b(pp + qq) + a(qq + 2pq).
;Therefore
;p' = p^2 + q^2
;q' = 2pq + q^2

