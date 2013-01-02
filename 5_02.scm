(load "ch5-regsim.scm")

(controller
  setup
    (assign c (const 1))
    (assign p (const 1))
  test-b
    (test (op >) (reg c) (reg n))
    (branch (label fact-done))
    (assign p (op *) (reg c) (reg p))
    (assign c (op +) (reg c) (const 1))
    (goto (label test-b))
  fact-done)

;(define fact-machine
  ;(make-machine
   ;'(c p n)
   ;(list (list '> >) (list '* *) (list '+ +))
   ;'(setup
       ;(assign c (const 1))
       ;(assign p (const 1))
     ;test-b
       ;(test (op >) (reg c) (reg n))
       ;(branch (label fact-done))
       ;(assign p (op *) (reg c) (reg p))
       ;(assign c (op +) (reg c) (const 1))
       ;(goto (label test-b))
     ;fact-done)))
;(set-register-contents! fact-machine 'n 3)
;(start fact-machine)
;(get-register-contents fact-machine 'p)

