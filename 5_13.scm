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
(define (make-machine ops controller-text)
  (let* ((machine (make-new-machine))
         (registers-with-dups (filter not-null?
                                      (map extract-register-name controller-text)))
         (register-names (delete-duplicates registers-with-dups)))
    (for-each (lambda (register-name)
                ((machine 'allocate-register) register-name))
              register-names)
    ((machine 'install-operations) ops)    
    ((machine 'install-instruction-sequence)
     (assemble controller-text machine))
    machine))

(define expt-machine-rec
  (make-machine
    (list (list '= =) (list '* *) (list '- -))
    '((assign continue (label expt-done))
      (assign n (const 2))
      (assign b (const 4))
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
(start expt-machine-rec)
(get-register-contents expt-machine-rec 'val)


