(load "ch5-regsim.scm")

(define fact-machine
  (make-machine
   '(n continue val)
   (list (list '= =) (list '* *) (list '+ +) (list '- -) (list '< <))
    '((assign continue (label fact-done))     ; set up final return address
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
       (assign val (op *) (reg n) (reg val))   ; val now contains n(n - 1)!
       (goto (reg continue))                   ; return to caller
     base-case
       (assign val (const 1))                  ; base case: 1! = 1
       (goto (reg continue))                   ; return to caller
     fact-done)))

(set-register-contents! fact-machine 'n 3)
(start fact-machine)
(get-register-contents fact-machine 'val)
((fact-machine 'stack) 'print-statistics)
;(total-pushes = 4 maximum-depth = 4)
((fact-machine 'stack) 'initialize)
(set-register-contents! fact-machine 'n 4)
(start fact-machine)
(get-register-contents fact-machine 'val)
((fact-machine 'stack) 'print-statistics)
;(total-pushes = 6 maximum-depth = 6)
((fact-machine 'stack) 'initialize)

; Total depth and number of pushes have the same values. We can get formula for
; them from this set of equations:
; 3n+a=4 and 4n+a=6
;
; Resulting affine function: f(n) = 2n - 2.

