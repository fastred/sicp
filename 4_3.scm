(load "ch4-mceval.scm")
(load "get_and_put.scm")

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((geteval (car exp)) ((geteval (car exp)) exp env))
        ((application? exp)
         (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
        (else
          (error "Unknown expression type -- EVAL" exp))))

(define puteval
  (lambda (type item) (put 'eval type item)))
(define geteval
  (lambda (type) (get 'eval type)))

(puteval 'quote (lambda (exp env) (text-of-quotation exp)))
(puteval 'set! eval-assignment)
(puteval 'define eval-definition)
(puteval 'if eval-if)
(puteval 'lambda
         (lambda (exp env)
           (make-procedure (lambda-parameters exp)
                           (lambda-body exp)
                           env)))
(puteval 'begin (lambda (exp env)
                  (eval-sequence (begin-actions exp) env)))
(puteval 'cond (lambda (exp env)
                 (eval (cond->if exp) env)))

; test
;(define the-global-environment (setup-environment))
;(eval '(define square (lambda (x) (* x x))) the-global-environment)
;(eval '(define x 5) the-global-environment)
;(eval '(square 2) the-global-environment)
;(eval '(begin 1 2 3) the-global-environment)
;(eval '(cond ((= x 1) 1) ((= x 2) 2) (else 3)) the-global-environment)
;(eval '(+ x 1) the-global-environment)

