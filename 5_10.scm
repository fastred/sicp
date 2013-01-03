(load "ch5-regsim.scm")
(define (make-execution-procedure inst labels machine
                                  pc flag stack ops)
  (cond ((eq? (car inst) 'assign)
         (make-assign inst machine labels ops pc))
        ((eq? (car inst) 'test)
         (make-test inst machine labels ops flag pc))
        ((eq? (car inst) 'branch)
         (make-branch inst machine labels flag pc))
        ((eq? (car inst) 'jump)
         (make-goto inst machine labels pc))
        ((eq? (car inst) 'push)
         (make-save inst machine stack pc))
        ((eq? (car inst) 'pop)
         (make-restore inst machine stack pc))
        ((eq? (car inst) 'perform)
         (make-perform inst machine labels ops pc))
        ((eq? (car inst) 'nop)
         (make-nop inst machine pc))
        (else (error "Unknown instruction type -- ASSEMBLE"
                     inst))))
(define (label-exp? exp) (tagged-list? exp 'lab))

(define (make-nop inst machine pc)
  (lambda ()
    (advance-pc pc)))

(define machine
  (make-machine
   '(a b)
   (list (list '= =) (list '* *) (list '+ +) (list '- -))
   '(
    start
      (assign b (const 2))
      (nop) ; new operation that doesn't do anything
      (assign a (op *) (const 2) (reg b))
      (jump (lab there)) ; changes in namings
      (assign a (const 3))
    there)))

(start machine)
(get-register-contents machine 'a)
