; I've decided to remove binding only from the first frame. Removing binding
; from other enviroments could easily break code.

(load "ch4-mceval.scm")

(define (make-unbound! var env)
  (let ((frame (first-frame env)))
    (define (scan vars vals)
      (cond ((null? vars)
             (error "Unbound-variable -- make-unbound!"))
            ((eq? var (car vars))
             (set-car! vars (cdr vars))
             (set-car! vals (cdr vals)))
            (else (scan (cdr vars) (cdr vals)))))
    (scan (frame-variables frame)
          (frame-values frame))))


;test
;(define the-global-environment (setup-environment))
;(eval '(define x 1) the-global-environment)
;(make-unbound! 'x the-global-environment)
;(eval 'x the-global-environment)
