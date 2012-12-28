(define (square x) (* x x))

(define (iterative-expt b n)
  (define (expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (expt-iter (square b) (/ n 2) a))
          (else (expt-iter b (- n 1) (* a b)))))
  (expt-iter b n 1))

;because: b^n = (b^n/2)^2 = (b^2)^(n/2)

