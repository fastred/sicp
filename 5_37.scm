(load "5_33.scm")

(define (preserving regs seq1 seq2)
  (if (null? regs)
    (append-instruction-sequences seq1 seq2)
    (let ((first-reg (car regs)))
      (preserving (cdr regs)
                  (make-instruction-sequence
                    (list-union (list first-reg)
                                (registers-needed seq1))
                    (list-difference (registers-modified seq1)
                                     (list first-reg))
                    (append `((save ,first-reg))
                            (statements seq1)
                            `((restore ,first-reg))))
                  seq2))))


; code for (+ 1 2)
  (save continue) ; 3 not needed operations
  (save env)
  (save continue)
  (assign proc (op lookup-variable-value) (const +) (reg env))
  (restore continue) ; 3 not needed operations
  (restore env)
  (restore continue)
  (save continue) ; 4 not needed operations
  (save proc)
  (save env)
  (save continue)
  (assign val (const 2))
  (restore continue) ; not neeed
  (assign argl (op list) (reg val))
  (restore env) ; 3 not needed operations
  (save argl)
  (save continue)
  (assign val (const 1))
  (restore continue) ; 2 not needed operations
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc) ; 2 not needed operations
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch3))
compiled-branch2
  (assign continue (label after-call1))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch3
  (save continue) ; not needed
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (restore continue) ; not needed
after-call1

