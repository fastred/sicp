(define (pascal c r)
  (cond ((or (= c 0) (= c r)) 1)
        (else (+ (pascal (- c 1) (- r 1)) (pascal c (- r 1))))))

