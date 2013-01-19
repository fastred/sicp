(load "5_43.scm")

; We work with compiler that uses compile time environment, so I've decided
; to reimplement these procedures from ex. 5.38.
(define (spread-arguments operands comp-time-env)
  (let ((op1 (compile (car operands) 'arg1 'next comp-time-env))
        (op2 (compile (cadr operands) 'arg2 'next comp-time-env)))
    (list
      op1
      op2)))

(define (compile-sel-primitive exp target linkage comp-time-env)
  (let ((operands-code (spread-arguments (operands exp) comp-time-env))
        (operator (operator exp))
        (after-call (make-label 'after-call)))
    (end-with-linkage linkage
      (preserving '(continue env)
        (car operands-code)
        (preserving '(arg1)
          (cadr operands-code)
          (make-instruction-sequence '(arg1 arg2) (list target)
            `((assign ,target (op ,operator) (reg arg1) (reg arg2)))))))))

(define (primitive-overwritten? operator comp-time-env)
  (not (eq? (find-variable operator comp-time-env) 'not-found)))

(define (selected-primitive? exp comp-time-env)
  (let ((operator (car exp)))
    (and (pair? exp) (memq operator '(+ - * /))
         (not (primitive-overwritten? operator comp-time-env)))))

(define (compile exp target linkage comp-time-env)
  (cond ((self-evaluating? exp)
         (compile-self-evaluating exp target linkage comp-time-env))
        ((quoted? exp) (compile-quoted exp target linkage comp-time-env))
        ((variable? exp)
         (compile-variable exp target linkage comp-time-env))
        ((assignment? exp)
         (compile-assignment exp target linkage comp-time-env))
        ((definition? exp)
         (compile-definition exp target linkage comp-time-env))
        ((if? exp) (compile-if exp target linkage comp-time-env))
        ((lambda? exp) (compile-lambda exp target linkage comp-time-env))
        ((begin? exp)
         (compile-sequence (begin-actions exp)
                           target
                           linkage comp-time-env))
        ((cond? exp) (compile (cond->if exp) target linkage comp-time-env))
        ((selected-primitive? exp comp-time-env)
         (compile-sel-primitive exp target linkage comp-time-env))
        ((application? exp)
         (compile-application exp target linkage comp-time-env))
        (else
         (error "Unknown expression type -- COMPILE" exp))))

;(define code '((lambda (+ a b) (+ a b)) * 3 3))
;(show-formatted (compile code
                         ;'val
                         ;'next
                         ;empty-comp-time-env))
;(compile-and-go code)
