; Unless could be simply implemented with a little use of helpers for if special form:

(load "ch4-mceval.scm")

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((unless? exp) (eval (unless->if exp) env))
        ((if? exp) (eval-if exp env))
        ((lambda? exp)
         (make-procedure (lambda-parameters exp)
                         (lambda-body exp)
                         env))
        ((begin? exp) 
         (eval-sequence (begin-actions exp) env))
        ((cond? exp) (eval (cond->if exp) env))
        ((application? exp)
         (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
        (else
         (error "Unknown expression type -- EVAL" exp))))

(define (unless? exp) (tagged-list? exp 'unless))
(define unless-predicate cadr)
(define unless-consequent caddr)
(define unless-alternative cadddr)
(define (unless->if exp)
  (make-if (unless-predicate exp)
           (unless-alternative exp)
           (unless-consequent exp)))

; It might be useful to have 'unless' as a procedure, because we could pass it
; as an argument to a procedure.
