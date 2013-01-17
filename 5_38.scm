(load "load-eceval-compiler.scm")
(load "ch5-eceval-compiler-extended.scm")
(load "5_33.scm")

(define (compile-and-go expression)
  (let ((instructions
          (assemble (statements
                      (compile expression 'val 'return))
                    eceval)))
    (set! the-global-environment (setup-environment))
    (set-register-contents! eceval 'val instructions)
    (set-register-contents! eceval 'flag true)
    (start eceval)))

(define (selected-primitive? exp)
  (and (pair? exp) (memq (car exp) '(+ - * /))))

(define (spread-arguments operands)
  (let ((op1 (compile (car operands) 'arg1 'next))
        (op2 (compile (cadr operands) 'arg2 'next)))
    (list
      op1
      op2)))

(define (compile-sel-primitive exp target linkage)
  (let ((operands-code (spread-arguments (operands exp)))
        (operator (operator exp))
        (after-call (make-label 'after-call)))
    (end-with-linkage linkage
      (preserving '(continue env)
        (car operands-code)
        (preserving '(arg1)
          (cadr operands-code)
          (make-instruction-sequence '(arg1 arg2) (list target)
            `((assign ,target (op ,operator) (reg arg1) (reg arg2)))))))))

(define (compile exp target linkage)
  (cond ((self-evaluating? exp)
         (compile-self-evaluating exp target linkage))
        ((quoted? exp) (compile-quoted exp target linkage))
        ((variable? exp)
         (compile-variable exp target linkage))
        ((assignment? exp)
         (compile-assignment exp target linkage))
        ((definition? exp)
         (compile-definition exp target linkage))
        ((if? exp) (compile-if exp target linkage))
        ((lambda? exp) (compile-lambda exp target linkage))
        ((begin? exp)
         (compile-sequence (begin-actions exp)
                           target
                           linkage))
        ((cond? exp) (compile (cond->if exp) target linkage))
        ((selected-primitive? exp)
         (compile-sel-primitive exp target linkage))
        ((application? exp)
         (compile-application exp target linkage))
        (else
         (error "Unknown expression type -- COMPILE" exp))))

(define code 
 '(define (factorial n)
    (if (= n 1)
        1
        (* (factorial (- n 1)) n))))
;(compile-and-go code)


; c) Two procedure calls ('*' and '-') are now replaced with open code. Thanks to that
; resulting output is shorter and we save some pushing and popping from the stack.
; Factorial output:
;
  ;(assign val (op make-compiled-procedure) (label entry2) (reg env))
  ;(goto (label after-lambda1))
;entry2
  ;(assign env (op compiled-procedure-env) (reg proc))
  ;(assign env (op extend-environment) (const (n)) (reg argl) (reg env))
  ;(save continue)
  ;(save env)
  ;(assign proc (op lookup-variable-value) (const =) (reg env))
  ;(assign val (const 1))
  ;(assign argl (op list) (reg val))
  ;(assign val (op lookup-variable-value) (const n) (reg env))
  ;(assign argl (op cons) (reg val) (reg argl))
  ;(test (op primitive-procedure?) (reg proc))
  ;(branch (label primitive-branch14))
;compiled-branch13
  ;(assign continue (label after-call12))
  ;(assign val (op compiled-procedure-entry) (reg proc))
  ;(goto (reg val))
;primitive-branch14
  ;(assign val (op apply-primitive-procedure) (reg proc) (reg argl))
;after-call12
  ;(restore env)
  ;(restore continue)
  ;(test (op false?) (reg val))
  ;(branch (label false-branch4))
;true-branch5
  ;(assign val (const 1))
  ;(goto (reg continue))
;false-branch4
  ;(save continue)
  ;(save env)
  ;(assign proc (op lookup-variable-value) (const factorial) (reg env))
  ;(assign arg1 (op lookup-variable-value) (const n) (reg env))
  ;(assign arg2 (const 1))
  ;(assign val (op -) (reg arg1) (reg arg2))
  ;(assign argl (op list) (reg val))
  ;(test (op primitive-procedure?) (reg proc))
  ;(branch (label primitive-branch10))
;compiled-branch9
  ;(assign continue (label proc-return11))
  ;(assign val (op compiled-procedure-entry) (reg proc))
  ;(goto (reg val))
;proc-return11
  ;(assign arg1 (reg val))
  ;(goto (label after-call8))
;primitive-branch10
  ;(assign arg1 (op apply-primitive-procedure) (reg proc) (reg argl))
;after-call8
  ;(restore env)
  ;(assign arg2 (op lookup-variable-value) (const n) (reg env))
  ;(assign val (op *) (reg arg1) (reg arg2))
  ;(restore continue)
  ;(goto (reg continue))
;after-if3
;after-lambda1
  ;(perform (op define-variable!) (const factorial) (reg val) (reg env))
  ;(assign val (const ok))
