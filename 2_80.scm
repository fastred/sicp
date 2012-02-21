(define (=zero? x) (apply-generic '=zero? x))

(define (install-scheme-number-package)
  (define (=zero? x)
    (= x 0))
  (put '=zero? '(scheme-number) =zero?)
  'done)

(define (install-rational-package)
  (define (=zero? x)
    (zero? (numer x)))
  (put '=zero? '(rational) =zero?)
  'done)

(define (install-complex-package)
  (define (=zero? z)
    (and (zero? (real-part z))
         (zero? (imag-part z))))
  (put '=zero? '(complex) =zero?)
  'done)

