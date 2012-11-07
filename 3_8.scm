(define f
  (let ((val 'not-set))
    (lambda (x)
      (if (eq? val 'not-set)
        (begin (set! val x)
               val)
        0))))
 
;(+ (f 0) (f 1))
;(+ (f 1) (f 0))
