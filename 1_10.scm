(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
;Value: 1024
(A 2 4)
;Value: 65536
(A 3 3)
;Value: 65536

(define (f n) (A 0 n))
; f(n) = 2*n
(define (g n) (A 1 n))
; g(n) = 2^n
(define (h n) (A 2 n))
;        2 if n = 1
; h(n) =
;        2^h(n-1) if n > 1

