(load "ch5-regsim.scm")

;a)
;
;We can replace:
   ;(assign n (reg val))               ; n now contains Fib(n - 2)
   ;(restore val)                      ; val now contains Fib(n - 1)
;with:
   ;(restore n)
;Values stored in n and val are now switched, but it doesn't change value of val
;computed at the end of this label.


;b)

(define (make-save inst machine stack pc)
  (let ((reg (get-register machine
                           (stack-inst-reg-name inst)))
        (register-name (stack-inst-reg-name inst)))
    (lambda ()
      (push stack (cons register-name (get-contents reg)))
      (advance-pc pc))))

(define (make-restore inst machine stack pc)
  (let ((reg (get-register machine
                           (stack-inst-reg-name inst)))
        (register-name (stack-inst-reg-name inst)))
    (lambda ()
      (let ((saved-register (pop stack)))
        (if (eq? (car saved-register) register-name)
          (begin (set-contents! reg (cdr saved-register))
                 (advance-pc pc))
          (error "Popped from stack into different register -- MAKE-RESTORE"))))))

;c) It would be best to change 'make-stack' to return object acting as
;a stacks' container. API of simulator wouldn't have to be much changed.
;TODO
