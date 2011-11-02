(define (fn-rec n)
  (cond ((< n 3) n)
        (else (+ (fn-rec (- n 1))
                 (* 2 (fn-rec (- n 2)))
                 (* 3 (fn-rec (- n 3)))))))

(fn-rec 3)

; TODO: iterative
