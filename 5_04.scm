; recursive
(controller
  (assign continue (label expt-done))
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
   expt-done)

; iterative
(controller
  setup
    (assign c (reg n))
    (assign p (const 1))
  expt-iter
    (test (op =) (reg c) (const 0))
    (branch (label expt-done))
    (assign c (op -) (reg c) (const 1))
    (assign p (op *) (reg b) (reg p))
    (goto (label expt-iter))
  expt-done)
