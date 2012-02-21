(define (raise x) (apply-generic 'raise x))

(define (install-scheme-number-package)
  (define (raise x)
    (make-rational x 1))
  (put 'raise '(scheme-number) raise)
  'done)

; real numbers are omitted
(define (install-rational-package)
  (define (raise x)
    (make-complex-from-real-imag (/ (numer x) (denom x)) 0))
  (put 'raise '(rational) raise)
  'done)
