(load "4_6.scm")

(define (make-let bindings body)
  (cons 'let (cons bindings body)))
(define letrec-vars let-vars)
(define letrec-bindings let-bindings)
(define letrec-body let-body)
(define bind-var car)
(define bind-val cadr)

(define (letrec-unassigned-bindings bindings)
  (map (lambda (var) (list var ''*unassigned*)) (letrec-vars bindings)))

(define (new-name var) (symbol-append '___ var))

(define (letrec-named-exps bindings)
  (map (lambda (binding) (list (new-name (bind-var binding))
                               (bind-val binding)))
         bindings))

(define (letrec-set! bindings)
  (map (lambda (binding) (list 'set! (bind-var binding)
                               (new-name (bind-var binding))))
       bindings))

(define (letrec->combination exp env)
  (let ((bindings (letrec-bindings exp)))
    (eval (make-let (letrec-unassigned-bindings bindings)
              (append (list (make-let (letrec-named-exps bindings)
                                (letrec-set! bindings)))
                      (letrec-body exp))) env)))

(puteval 'letrec letrec->combination)


; b)

(define (f x)
  (let ((even?
            (lambda (n)
              (if (= n 0)
                  true
                  (odd? (- n 1)))))
           (odd?
            (lambda (n)
              (if (= n 0)
                  false
                  (even? (- n 1))))))
    <rest of body of f>))

; is transformed to:

(define (f x)
  ((lambda (even? odd?)
    <rest of body of f>)
            (lambda (n)
              (if (= n 0)
                  true
                  (odd? (- n 1))))
            (lambda (n)
              (if (= n 0)
                false
                (even? (- n 1))))))

; Lambdas passed as arguments to the first lambda have their own environments.
; Environment of the first lambda doesn't contain definition of 'odd?'.
; Environment of the second lambda doesn't contain 'even?'.
