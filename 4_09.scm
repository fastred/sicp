(load "4_3.scm")

(define (for-from exp)
  (cadr exp))

(define (for-to exp)
  (caddr exp))

(define (for-body exp)
  (cadddr exp))

(define (for-range exp env)
  (for-range-transform (for-from exp) (for-to exp) (for-body exp)))
(define (for-range exp env)
  (eval (for-range-transform (for-from exp) (for-to exp) (for-body exp)) env))

(define (for-range-transform from to body)
  (list (make-lambda '() (list (list 'define (list 'loop 'from 'to)
                                     (make-if '(< from to)
                                              (list 'begin body (list 'loop '(+ from 1) 'to))
                                              'false))
                               (list 'loop from to)))))

(puteval 'for-range for-range)

(define the-global-environment (setup-environment))
