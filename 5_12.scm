(load "ch5-regsim.scm")

(define (extract-register-name inst)
  (cond ((symbol? inst) '())
        ((eq? (car inst) 'assign)
         (assign-reg-name inst))
        ((or (eq? (car inst) 'save) (eq? (car inst) 'restore))
         (stack-inst-reg-name inst))
        ((eq? (car inst) 'goto)
         (let ((dest (goto-dest inst)))
           (if (register-exp? dest)
             (register-exp-reg dest)
             '())))
        (else '())))

(define (not-null? x)
  (not (null? x)))

(define (instruction? exp) (not (symbol? exp)))

; returns all instructions in a controller
(define (get-instructions text)
  (let ((insts (delete-duplicates (filter instruction? text))))
    ; we sort by the first element of a list
    (sort insts (lambda (x y) (string<? (symbol->string (car x))
                                        (symbol->string (car y)))))))

; helper procedure
(define (get-from-instructions f insts)
  (delete-duplicates (filter not-null? (map f insts))))

(define (get-entry-points insts)
  (get-from-instructions
    (lambda (inst)
      (if (eq? (car inst) 'goto)
        (let ((dest (goto-dest inst)))
          (if (register-exp? dest)
            (register-exp-reg dest)
            '()))
      '())) insts))

(define (get-saved-and-restored insts)
  (get-from-instructions
    (lambda (inst) (if (or (eq? (car inst) 'save)
                           (eq? (car inst) 'restore))
                     (stack-inst-reg-name inst)
                     '())) insts))

(define (get-assigns insts)
  (let ((reg-assoc '()))
    (get-from-instructions
      (lambda (inst) (if (eq? (car inst) 'assign)
                       (let* ((reg-name (assign-reg-name inst))
                              (reg-op (assign-value-exp inst))
                              (pair (assoc reg-name reg-assoc)))
                         ; we successively build association list
                         (if pair
                           ; we don't want duplicates
                           (if (not (member reg-op (cdr pair)))
                             (append! (cdr pair) (list reg-op)))
                           (if (null? reg-assoc)
                             ; build list if it is empty
                             (set! reg-assoc (list (list reg-name reg-op)))
                             ; add new association to list
                             (append! reg-assoc (list (list reg-name reg-op))))))))
      insts)
    reg-assoc))

(define (make-machine register-names ops controller-text)
  (let* ((machine (make-new-machine))
        (all-instructions (get-instructions controller-text))
        (entry-points (get-entry-points all-instructions))
        (saved-restored (get-saved-and-restored all-instructions))
        (reg-with-ops (get-assigns all-instructions)))
    ((machine 'install-data-paths) all-instructions entry-points saved-restored
                                  reg-with-ops)
    (for-each (lambda (register-name)
                ((machine 'allocate-register) register-name))
              register-names)
    ((machine 'install-operations) ops)
    ((machine 'install-instruction-sequence)
     (assemble controller-text machine))
    machine))

(define (make-new-machine)
  (let ((pc (make-register 'pc))
        (flag (make-register 'flag))
        (stack (make-stack))
        (the-instruction-sequence '())
        (data-paths '()))
    (let ((the-ops
           (list (list 'initialize-stack
                       (lambda () (stack 'initialize)))
                 ;;**next for monitored stack (as in section 5.2.4)
                 ;;  -- comment out if not wanted
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
              (begin
                ((instruction-execution-proc (car insts)))
                (execute)))))
      (define (install-data-paths instructions entry-points saved-restored
                                  reg-with-ops)
        (set! data-paths (list (list 'instructions instructions)
                               (list 'entry-points entry-points)
                               (list 'saved-restored saved-restored)
                               (list 'reg-with-ops reg-with-ops)))
        'ok)
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
              ((eq? message 'install-data-paths) install-data-paths)
              ((eq? message 'get-data-paths) data-paths)
              (else (error "Unknown request -- MACHINE" message))))
      dispatch)))

(define fib-machine
  (make-machine
   '(n continue val)
   (list (list '= =) (list '* *) (list '+ +) (list '- -) (list '< <))
   '(
   (assign continue (label fib-done))
   fib-loop
     (test (op <) (reg n) (const 2))
     (branch (label immediate-answer))
     ;; set up to compute Fib(n - 1)
     (save continue)
     (assign continue (label afterfib-n-1))
     (save n)                           ; save old value of n
     (assign n (op -) (reg n) (const 1)); clobber n to n - 1
     (goto (label fib-loop))            ; perform recursive call
   afterfib-n-1                         ; upon return, val contains Fib(n - 1)
     (restore n)
     (restore continue)
     ;; set up to compute Fib(n - 2)
     (assign n (op -) (reg n) (const 2))
     (save continue)
     (assign continue (label afterfib-n-2))
     (save val)                         ; save Fib(n - 1)
     (goto (label fib-loop))
   afterfib-n-2                         ; upon return, val contains Fib(n - 2)
     (assign n (reg val))               ; n now contains Fib(n - 2)
     (restore val)                      ; val now contains Fib(n - 1)
     (restore continue)
     (assign val                        ;  Fib(n - 1) +  Fib(n - 2)
             (op +) (reg val) (reg n)) 
     (goto (reg continue))              ; return to caller, answer is in val
   immediate-answer
     (assign val (reg n))               ; base case:  Fib(n) = n
     (goto (reg continue))
   fib-done)))

(fib-machine 'get-data-paths)
;(instructions ((assign continue (label fib-done))
               ;(assign continue (label afterfib-n-1))
               ;(assign n (op -) (reg n) (const 1))
               ;(assign n (op -) (reg n) (const 2))
               ;(assign continue (label afterfib-n-2))
               ;(assign n (reg val))
               ;(assign val (op +) (reg val) (reg n))
               ;(assign val (reg n)) (branch (label immediate-answer))
               ;(goto (label fib-loop))
               ;(goto (reg continue))
               ;(restore n)
               ;(restore continue)
               ;(restore val)
               ;(save continue)
               ;(save n)
               ;(save val)
               ;(test (op <) (reg n) (const 2))))
;(entry-points (continue))
;(saved-restored (n continue val))
;(reg-with-ops ((continue ((label fib-done)) ((label afterfib-n-1)) ((label afterfib-n-2)))
               ;(n ((op -) (reg n) (const 1)) ((op -) (reg n) (const 2)) ((reg val)))
               ;(val ((op +) (reg val) (reg n)) ((reg n)))))

