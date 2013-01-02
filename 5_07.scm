(load "ch5-regsim.scm")

(define expt-machine-rec
  (make-machine
   '(b n continue val)
   (list (list '= =) (list '* *) (list '+ +) (list '- -))
   '((assign continue (label expt-done))
     expt-loop
       (test (op =) (reg n) (const 0))
       (branch (label base-case))
       (save continue)
       (assign n (op -) (reg n) (const 1))
       (assign continue (label after-expt))
       (goto (label expt-loop))
     after-expt
       (restore continue)
       (assign val (op *) (reg b) (reg val))
       (goto (reg continue))
     base-case
       (assign val (const 1))
       (goto (reg continue))
     expt-done)))
;(set-register-contents! expt-machine-rec 'b 3)
;(set-register-contents! expt-machine-rec 'n 3)
;(start expt-machine-rec)
;(get-register-contents expt-machine-rec 'val)


(define expt-machine-iter
  (make-machine
   '(b n c p)
   (list (list '= =) (list '* *) (list '+ +) (list '- -))
   '(setup
      (assign c (reg n))
      (assign p (const 1))
     expt-iter
       (test (op =) (reg c) (const 0))
       (branch (label expt-done))
       (assign c (op -) (reg c) (const 1))
       (assign p (op *) (reg b) (reg p))
       (goto (label expt-iter))
     expt-done)))
;(set-register-contents! expt-machine-iter 'b 3)
;(set-register-contents! expt-machine-iter 'n 3)
;(start expt-machine-iter)
;(get-register-contents expt-machine-iter 'p)



