(load "ch2support.scm")
(define (install-deriv-package)
  (define (sum? x)
    (and (pair? x) (eq? (car x) '+)))

  (define (addend s) (car s))

  (define (augend s) (cadr s))

  (define (product? x)
    (and (pair? x) (eq? (car x) '*)))

  (define (multiplier p) (car p))

  (define (multiplicand p) (cadr p))

  (define (base e) (car e))

  (define (exponent e) (cadr e))

  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))

  (define (=number? exp num)
    (and (number? exp) (= exp num)))

  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list '* m1 m2))))

  (define (make-exponentiation b e)
    (cond ((=number? e 0) 1)
          ((=number? e 1) b)
          ((and (number? b) (number? e)) (expt b e))
          (else (list '** b e))))

  (define (deriv-sum operands var)
    (make-sum (deriv (addend operands) var)
              (deriv (augend operands) var)))

  (define (deriv-mul operands var)
    (make-sum
      (make-product (multiplier operands)
                    (deriv (multiplicand operands) var))
      (make-product (deriv (multiplier operands) var)
                    (multiplicand operands))))

  (define (deriv-exp operands var)
    (make-product
      (make-product (deriv (base operands) var)
                    (exponent operands))
      (make-exponentiation (base operands)
                           (make-sum (exponent operands) -1))))

  (put 'deriv '+ deriv-sum)
  (put 'deriv '* deriv-mul)
  (put 'deriv '** deriv-exp)
  'done)

(install-deriv-package)

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (operator exp) (car exp))

(define (operands exp) (cdr exp))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp)) (operands exp)
                                           var))))
; example
(deriv '(** (* 2 x) n) 'x)

;a) We can't put number? and same-variable? in the data-directed dispatch because
;numbers and variables don't have type tags attached. (operator exp) would produce
;an error.

;d) We would need to change applications of 'put' and 'else' clause in 'deriv'

(define (install-deriv-package)
  ; ...
  (put '+ 'deriv deriv-sum)
  (put '* 'deriv deriv-mul)
  (put '** 'deriv deriv-exp))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get (operator exp) 'deriv) (operands exp)
                                           var))))
