(load "ch5-regsim.scm")

(define append-machine
  (make-machine
   '(x y val continue)
   (list (list '= =) (list '* *) (list '+ +) (list '- -) (list '< <)
         (list 'list list) (list 'null? null?) (list 'cons cons)
         (list 'car car) (list 'cdr cdr) (list 'pair? pair?)
         (list 'not not))
   '(
     (assign continue (label append-done))
      append-loop
        (test (op null?) (reg x))
        (branch (label null-x))
        ; set up to compute (append (cdr x) y)
        (save continue)
        (assign continue (label after-append-cdr))
        (save x)
        (assign x (op cdr) (reg x))
        (goto (label append-loop))
      after-append-cdr
        (restore x)
        (restore continue)
        ; compute (cons (car x) (append (cdr x) y))))
        (assign x (op car) (reg x))
        (assign val (op cons) (reg x) (reg val))
        (goto (reg continue))
      null-x
        (assign val (reg y)) ; if (null? x)
        (goto (reg continue))
      append-done)))

(define x (list 'a 'b))
(define y (list 'c 'd))
(set-register-contents! append-machine 'x x)
(set-register-contents! append-machine 'y y)
(start append-machine)
(get-register-contents append-machine 'val)

(define append!-machine
  (make-machine
   '(x y val continue temp)
   (list (list '= =) (list '* *) (list '+ +) (list '- -) (list '< <)
         (list 'list list) (list 'null? null?) (list 'cons cons)
         (list 'car car) (list 'cdr cdr) (list 'pair? pair?)
         (list 'not not) (list 'set-cdr! set-cdr!))
   '(
      (assign continue (label append!-body))
      (goto (label last-pair))
      append!-body
        ;(set-cdr! (last-pair x) y)
        (perform (op set-cdr!) (reg val) (reg y))
        (goto (label append!-done))
      last-pair ; last-pair procedure - returns result in register val
        (save x) ; we save x because we will alter it in this procedure
      lp-loop
        (assign temp (op cdr) (reg x))
        (test (op null?) (reg temp))
        (branch (label lp-done))
        (assign x (op cdr) (reg x))
        (goto (label lp-loop))
      lp-done
        (assign val (reg x))
        (restore x)
        (goto (reg continue))
      append!-done)))

(set-register-contents! append!-machine 'x x)
(set-register-contents! append!-machine 'y y)
(start append!-machine)
(get-register-contents append!-machine 'x)

