(load "ch5-compiler.scm")
(define (displayln line) (display line) (newline))
(define (show-formatted code)
  (let ((insts (caddr code)))
    (newline)
    (for-each (lambda (x) (if (not (null? x))
                            (if (not (symbol? x))
                              (begin (display "  ") (displayln x))
                              (displayln x))))
                insts)))

;(* (factorial (- n 1)) n)))
;false-branch4
  ;(assign proc (op lookup-variable-value) (const *) (reg env))
  ;(save continue)
  ;(save proc)
  ;(assign val (op lookup-variable-value) (const n) (reg env))
  ;(assign argl (op list) (reg val))
  ;(save argl)
  ;(assign proc (op lookup-variable-value) (const factorial) (reg env))
  ;(save proc)
  ;(assign proc (op lookup-variable-value) (const -) (reg env))
  ;(assign val (const 1))
  ;(assign argl (op list) (reg val))
  ;(assign val (op lookup-variable-value) (const n) (reg env))
  ;(assign argl (op cons) (reg val) (reg argl))
  ;(test (op primitive-procedure?) (reg proc))
  ;(branch (label primitive-branch8))
;...
;after-call9
  ;(restore argl)
  ;(assign argl (op cons) (reg val) (reg argl))
  ;(restore proc)
  ;(restore continue)
  ;(test (op primitive-procedure?) (reg proc))
  ;(branch (label primitive-branch14))


;(* n (factorial-alt (- n 1)))))
;false-branch4
  ;(assign proc (op lookup-variable-value) (const *) (reg env))
  ;(save continue)
  ;(save proc)
  ;(save env)
  ;(assign proc (op lookup-variable-value) (const factorial-alt) (reg env))
  ;(save proc)
  ;(assign proc (op lookup-variable-value) (const -) (reg env))
  ;(assign val (const 1))
  ;(assign argl (op list) (reg val))
  ;(assign val (op lookup-variable-value) (const n) (reg env))
  ;(assign argl (op cons) (reg val) (reg argl))
  ;(test (op primitive-procedure?) (reg proc))
  ;(branch (label primitive-branch8))
;...
;after-call9
  ;(assign argl (op list) (reg val))
  ;(restore env)
  ;(assign val (op lookup-variable-value) (const n) (reg env))
  ;(assign argl (op cons) (reg val) (reg argl))
  ;(restore proc)
  ;(restore continue)
  ;(test (op primitive-procedure?) (reg proc))
  ;(branch (label primitive-branch14))


;Difference in produced outputs is caused by different order of arguments to '*' application.
;Recall that arguments are evaluated from right to left.
;In 'factorial' we have to save 'argl', because we're in the middle of building
;argument list when we stumble on the procedure ('factorial') application.
;On the other hand in factorial-alt we don't need to save 'argl' because application 
;of 'factorial-alt' is first to be evaluated in argument list building. But we need
;to save 'env' because it may be changed by procedure application (we don't need
;to save it in 'factorial' because evaluation of last argument can alter current environment).
;
;Performance of both procedures is the same. We have the same numbers of instructions
;and stack operations.

