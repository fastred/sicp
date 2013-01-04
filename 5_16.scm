(load "ch5-regsim.scm")
(define (make-new-machine)
  (let ((pc (make-register 'pc))
        (flag (make-register 'flag))
        (stack (make-stack))
        (the-instruction-sequence '())
        (inst-count 0)
        (inst-tracing #f))
    (let ((the-ops
           (list (list 'initialize-stack
                       (lambda () (stack 'initialize)))
                 (list 'print-stack-statistics
                       (lambda () (stack 'print-statistics)))))
          (register-table
           (list (list 'pc pc) (list 'flag flag))))
      (define (allocate-register name)
        (if (assoc name register-table)
            (error "Multiply defined register: " name)
            (set! register-table
                  (cons (list name (make-register name))
                        register-table)))
        'register-allocated)
      (define (lookup-register name)
        (let ((val (assoc name register-table)))
          (if val
              (cadr val)
              (error "Unknown register:" name))))
      (define (execute)
        (let ((insts (get-contents pc)))
          (if (null? insts)
            'done
            (let ((instruction (car insts)))
              (begin
                (set! inst-count (+ inst-count 1))
                (if inst-tracing
                  (begin
                    (display (instruction-text instruction))
                    (newline)))
                ((instruction-execution-proc instruction))
                (execute))))))
      (define (get-inst-count) inst-count)
      (define (reset-inst-count)
          (set! inst-count 0)
          'ok)
      (define (trace-on) (set! inst-tracing #t) 'ok)
      (define (trace-off) (set! inst-tracing #f) 'ok)
      (define (dispatch message)
        (cond ((eq? message 'start)
               (set-contents! pc the-instruction-sequence)
               (execute))
              ((eq? message 'install-instruction-sequence)
               (lambda (seq) (set! the-instruction-sequence seq)))
              ((eq? message 'allocate-register) allocate-register)
              ((eq? message 'get-register) lookup-register)
              ((eq? message 'install-operations)
               (lambda (ops) (set! the-ops (append the-ops ops))))
              ((eq? message 'stack) stack)
              ((eq? message 'operations) the-ops)
              ((eq? message 'get-inst-count) (get-inst-count))
              ((eq? message 'reset-inst-count) (reset-inst-count))
              ((eq? message 'trace-on) (trace-on))
              ((eq? message 'trace-off) (trace-off))
              (else (error "Unknown request -- MACHINE" message))))
      dispatch)))

(define fact-machine
  (make-machine
   '(n continue val)
   (list (list '= =) (list '* *) (list '+ +) (list '- -) (list '< <))
    '((assign continue (label fact-done))
     fact-loop
       (test (op =) (reg n) (const 1))
       (branch (label base-case))
       (save continue)
       (save n)
       (assign n (op -) (reg n) (const 1))
       (assign continue (label after-fact))
       (goto (label fact-loop))
     after-fact
       (restore n)
       (restore continue)
       (assign val (op *) (reg n) (reg val))
       (goto (reg continue))
     base-case
       (assign val (const 1))
       (goto (reg continue))
     fact-done)))

(set-register-contents! fact-machine 'n 3)
(fact-machine 'trace-on)
(start fact-machine)
(get-register-contents fact-machine 'val)
(fact-machine 'trace-off)
(set-register-contents! fact-machine 'n 4)
(start fact-machine)
(get-register-contents fact-machine 'val)
