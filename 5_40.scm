(load "5_33.scm")
(load "5_39.scm")
(load "5_41.scm") ; In my opinion exercises 5.40 & 5.41 are in the wrong order,
; that's why I'm loading it in here
(load "load-eceval-compiler.scm")
(load "ch5-eceval-compiler-lexical")

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
        ((application? exp)
         (compile-application exp target linkage comp-time-env))
        (else
         (error "Unknown expression type -- COMPILE" exp))))

(define (make-instruction-sequence needs modifies statements)
  (list needs modifies statements))

(define (empty-instruction-sequence)
  (make-instruction-sequence '() '() '()))

(define (compile-self-evaluating exp target linkage comp-time-env)
  (end-with-linkage linkage
   (make-instruction-sequence '() (list target)
    `((assign ,target (const ,exp))))))

(define (compile-quoted exp target linkage comp-time-env)
  (end-with-linkage linkage
   (make-instruction-sequence '() (list target)
    `((assign ,target (const ,(text-of-quotation exp)))))))

(define (compile-variable exp target linkage comp-time-env)
  (end-with-linkage linkage
   (make-instruction-sequence '(env) (list target)
    `((assign ,target
              (op lookup-variable-value)
              (const ,exp)
              (reg env))))))

(define (compile-assignment exp target linkage comp-time-env)
  (let ((var (assignment-variable exp))
        (get-value-code
         (compile (assignment-value exp) 'val 'next comp-time-env)))
    (end-with-linkage linkage
     (preserving '(env)
      get-value-code
      (make-instruction-sequence '(env val) (list target)
       `((perform (op set-variable-value!)
                  (const ,var)
                  (reg val)
                  (reg env))
         (assign ,target (const ok))))))))

(define (compile-definition exp target linkage comp-time-env)
  (let ((var (definition-variable exp))
        (get-value-code
         (compile (definition-value exp) 'val 'next comp-time-env)))
    (end-with-linkage linkage
     (preserving '(env)
      get-value-code
      (make-instruction-sequence '(env val) (list target)
       `((perform (op define-variable!)
                  (const ,var)
                  (reg val)
                  (reg env))
         (assign ,target (const ok))))))))

(define (compile-if exp target linkage comp-time-env)
  (let ((t-branch (make-label 'true-branch))
        (f-branch (make-label 'false-branch))                    
        (after-if (make-label 'after-if)))
    (let ((consequent-linkage
           (if (eq? linkage 'next) after-if linkage)))
      (let ((p-code (compile (if-predicate exp) 'val 'next comp-time-env))
            (c-code
             (compile
              (if-consequent exp) target consequent-linkage comp-time-env))
            (a-code
             (compile (if-alternative exp) target linkage comp-time-env)))
        (preserving '(env continue)
         p-code
         (append-instruction-sequences
          (make-instruction-sequence '(val) '()
           `((test (op false?) (reg val))
             (branch (label ,f-branch))))
          (parallel-instruction-sequences
           (append-instruction-sequences t-branch c-code)
           (append-instruction-sequences f-branch a-code))
          after-if))))))

(define (compile-sequence seq target linkage comp-time-env)
  (if (last-exp? seq)
      (compile (first-exp seq) target linkage comp-time-env)
      (preserving '(env continue)
       (compile (first-exp seq) target 'next comp-time-env)
       (compile-sequence (rest-exps seq) target linkage comp-time-env))))

(define (compile-lambda exp target linkage comp-time-env)
  (let ((proc-entry (make-label 'entry))
        (after-lambda (make-label 'after-lambda)))
    (let ((lambda-linkage
           (if (eq? linkage 'next) after-lambda linkage)))
      (append-instruction-sequences
       (tack-on-instruction-sequence
        (end-with-linkage lambda-linkage
         (make-instruction-sequence '(env) (list target)
          `((assign ,target
                    (op make-compiled-procedure)
                    (label ,proc-entry)
                    (reg env)))))
        (compile-lambda-body exp proc-entry comp-time-env))
       after-lambda))))

(define (compile-lambda-body exp proc-entry comp-time-env)
  (let ((formals (lambda-parameters exp)))
    (let ((new-comp-time-env (extend-comp-time-env formals comp-time-env)))
      (append-instruction-sequences
       (make-instruction-sequence '(env proc argl) '(env)
        `(,proc-entry
          (assign env (op compiled-procedure-env) (reg proc))
          (assign env
                  (op extend-environment)
                  (const ,formals)
                  (reg argl)
                  (reg env))))
       (compile-sequence (lambda-body exp) 'val 'return new-comp-time-env)))))

(define (compile-application exp target linkage comp-time-env)
  (let ((proc-code (compile (operator exp) 'proc 'next comp-time-env))
        (operand-codes
         (map (lambda (operand) (compile operand 'val 'next comp-time-env))
              (operands exp))))
    (preserving '(env continue)
     proc-code
     (preserving '(proc continue)
      (construct-arglist operand-codes)
      (compile-procedure-call target linkage comp-time-env)))))

(define (compile-procedure-call target linkage comp-time-env)
  (let ((primitive-branch (make-label 'primitive-branch))
        (compiled-branch (make-label 'compiled-branch))
        (after-call (make-label 'after-call)))
    (let ((compiled-linkage
           (if (eq? linkage 'next) after-call linkage)))
      (append-instruction-sequences
       (make-instruction-sequence '(proc) '()
        `((test (op primitive-procedure?) (reg proc))
          (branch (label ,primitive-branch))))
       (parallel-instruction-sequences
        (append-instruction-sequences
         compiled-branch
         (compile-proc-appl target compiled-linkage comp-time-env))
        (append-instruction-sequences
         primitive-branch
         (end-with-linkage linkage
          (make-instruction-sequence '(proc argl)
                                     (list target)
           `((assign ,target
                     (op apply-primitive-procedure)
                     (reg proc)
                     (reg argl)))))))
       after-call))))

(define (compile-proc-appl target linkage comp-time-env)
  (cond ((and (eq? target 'val) (not (eq? linkage 'return)))
         (make-instruction-sequence '(proc) all-regs
           `((assign continue (label ,linkage))
             (assign val (op compiled-procedure-entry)
                         (reg proc))
             (goto (reg val)))))
        ((and (not (eq? target 'val))
              (not (eq? linkage 'return)))
         (let ((proc-return (make-label 'proc-return)))
           (make-instruction-sequence '(proc) all-regs
            `((assign continue (label ,proc-return))
              (assign val (op compiled-procedure-entry)
                          (reg proc))
              (goto (reg val))
              ,proc-return
              (assign ,target (reg val))
              (goto (label ,linkage))))))
        ((and (eq? target 'val) (eq? linkage 'return))
         (make-instruction-sequence '(proc continue) all-regs
          '((assign val (op compiled-procedure-entry)
                        (reg proc))
            (goto (reg val)))))
        ((and (not (eq? target 'val)) (eq? linkage 'return))
         (error "return linkage, target not val -- COMPILE"
                target))))

(define (extend-comp-time-env formals comp-time-env)
  (cons formals comp-time-env))

(define empty-comp-time-env '())

(define (compile-and-go expression)
  (let ((instructions
          (assemble (statements
                      (compile expression 'val 'return empty-comp-time-env))
                    eceval)))
    (set! the-global-environment (setup-environment))
    (set-register-contents! eceval 'val instructions)
    (set-register-contents! eceval 'flag true)
    (start eceval)))

;(define code 
 ;'(define (factorial n)
    ;(if (= n 1)
        ;1
        ;(* (factorial (- n 1)) n))))
;(compile-and-go code)

;(compile-and-go '((lambda (x y)
   ;(lambda (a b c d e)
     ;((lambda (y z) (* x y z))
      ;(* a b x)
      ;(+ c d x))))
 ;3
 ;4))

