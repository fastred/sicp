(define (tan-cf x k)
  (define (numerator x i)
    (if (= i 0) x
      (* x x)))
  (define (denominator i)
    (- (* (+ i 1) 2) 1))
  (define (sub x k i)
    (cond ((= i k) (/ (numerator x i) (denominator i)))
      (else (/ (numerator x i) (- (denominator i) (sub x k (+ i 1)))))))
  (sub x k 0))

(tan-cf 0.5 100)
