; a) (define x 3) will be interpreted as a procedure application
;
; b)

(load "ch4-mceval.scm")

(define (eval exp env)
  (cond ((application? exp)
         (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
        ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((if? exp) (eval-if exp env))
        ((lambda? exp)
         (make-procedure (lambda-parameters exp)
                         (lambda-body exp)
                         env))
        ((begin? exp) 
         (eval-sequence (begin-actions exp) env))
        ((cond? exp) (eval (cond->if exp) env))
        (else
         (error "Unknown expression type -- EVAL" exp))))

(define (application? exp)
  (tagged-list? exp 'call))
(define (operator exp) (cadr exp))
(define (operands exp) (cddr exp))

;(define the-global-environment (setup-environment))
;(eval '(define x 1) the-global-environment)
;(eval '(+ x 1) the-global-environment) ; not a valid expression
;(eval '(call + x 1) the-global-environment)

