(load "ch4-mceval.scm")

(define (lookup env var go-up work-with-empty-env)
  (define (scan vars vals)
    (cond ((null? vars)
           (if go-up
             (lookup (enclosing-environment env) var go-up work-with-empty-env)
             vals))
          ((eq? var (car vars))
           vals)
          (else (scan (cdr vars) (cdr vals)))))
  (if (and work-with-empty-env (eq? env the-empty-environment))
    (error "Unbound variable" var)
    (let ((frame (first-frame env)))
      (scan (frame-variables frame)
            (frame-values frame)))))

(define (lookup-variable-value var env)
  (let ((vals (lookup env var #t #f)))
    (car vals)))

(define (set-variable-value! var val env)
  (let ((vals (lookup env var #t #f)))
    (set-car! vals val)))

(define (define-variable! var val env)
  (let ((vals (lookup env var #f #t)))
    (if (null? vals)
         (add-binding-to-frame! var val (first-frame env))
      (set-car! vals val))))

