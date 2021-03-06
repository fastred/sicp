(define (equ? x y) (apply-generic 'equ? x y))

(define (install-scheme-number-package)
  (define (equ? x y)
    (= x y))
  (put 'equ? '(scheme-number scheme-number) equ?)
  'done)

(define (install-rational-package)
  (define (equ? x1 x2)
    (let ((num1 (numer x1))
          (den1 (denom x1))
          (num2 (numer x2))
          (den2 (denom x2)))
          (= (* num1 den2) (* num2 den1))))
  (put 'equ? '(rational rational) equ?)
  'done)

(define (install-complex-package)
  (define (equ? z w)
    (and (= (real-part z) (real-part w))
         (= (imag-part z) (imag-part w))))
  (put 'equ? '(complex complex) equ?)
  'done)
