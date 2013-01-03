(load "ch5-regsim.scm")
(define (allowed-for-operation? exp)
  (or (register-exp? exp) (constant-exp? exp)))
(define (make-operation-exp exp machine labels operations)
  (let ((op (lookup-prim (operation-exp-op exp) operations))
        (aprocs
         (map (lambda (e)
                (if (allowed-for-operation? e)
                  (make-primitive-exp e machine labels)
                  (error "Labels are not allowed in operations -- MAKE-OPERATION-EXP")))
              (operation-exp-operands exp))))
    (lambda ()
      (apply op (map (lambda (p) (p)) aprocs)))))

(define machine
  (make-machine
   '(a b)
   (list (list '= =) (list '* *) (list '+ +) (list '- -))
   '(
    start
      (assign b (const 2))
      (assign a (op *) (const 2) (reg b))
      (assign a (op *) (const 2) (label there))
    there)))

(start machine)
(get-register-contents machine 'a)

