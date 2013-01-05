(load "ch5-regsim.scm")

(define cl-machine
  (make-machine
   '(tree val continue temp)
   (list (list '= =) (list '* *) (list '+ +) (list '- -) (list '< <)
         (list 'list list) (list 'null? null?) (list 'cons cons)
         (list 'car car) (list 'cdr cdr) (list 'pair? pair?)
         (list 'not not))
   '(
     (assign continue (label cl-done))
      cl-loop
        (test (op null?) (reg tree))
        (branch (label null-tree))
        (assign temp (op pair?) (reg tree))
        (test (op not) (reg temp))
        (branch (label not-pair))
        ; set up to compute (count-leaves (car tree))
        (save continue)
        (assign continue (label after-cl-car))
        (save tree) ; save old tree
        (assign tree (op car) (reg tree))
        (goto (label cl-loop))
      after-cl-car
        (restore tree)
        (restore continue)
        ; set up to compute (count-leaves (cdr tree))
        (assign tree (op cdr) (reg tree))
        (save continue)
        (assign continue (label after-cl-cdr))
        (save val) ; save (count-leaves (cdr tree))
        (goto (label cl-loop))
      after-cl-cdr
        (assign temp (reg val)) ; temp now contains (count-leaves (cdr tree))
        (restore val) ; val now contains (count-leaves (car tree))
        (restore continue)
        (assign val (op +) (reg temp) (reg val)) ; sum of leaves in branches
        (goto (reg continue))
      null-tree
        (assign val (const 0)) ; if (null? tree)
        (goto (reg continue))
      not-pair
        (assign val (const 1)) ; if (not (pair? tree))
        (goto (reg continue))
      cl-done)))


(define a (cons (list 1 2) (list 3 4)))
(set-register-contents! cl-machine 'tree (cons a a))
(start cl-machine)
(get-register-contents cl-machine 'val)


(define cl-iter-machine
  (make-machine
   '(tree val continue temp n)
   (list (list '= =) (list '* *) (list '+ +) (list '- -) (list '< <)
         (list 'list list) (list 'null? null?) (list 'cons cons)
         (list 'car car) (list 'cdr cdr) (list 'pair? pair?)
         (list 'not not))
   '(
     (assign continue (label cl-done))
     (assign n (const 0))
      ci-loop
        (test (op null?) (reg tree))
        (branch (label null-tree))
        (assign temp (op pair?) (reg tree))
        (test (op not) (reg temp))
        (branch (label not-pair))
        ; set up to compute (count-iter (car tree) n))
        (save continue)
        (save tree) ; save old tree
        (assign continue (label after-ci-car))
        (assign tree (op car) (reg tree))
        (goto (label ci-loop))
      after-ci-car
        (restore tree)
        (restore continue)
        ; set up to compute (count-iter (cdr tree) ...
        (assign tree (op cdr) (reg tree))
        (assign n (reg val)) ; n is set to the result of (count-iter (car ...
        (save continue)
        (assign continue (label after-ci-cdr))
        (goto (label ci-loop))
      after-ci-cdr ; val contains result
        (restore continue)
        (goto (reg continue))
      null-tree
        (assign val (reg n)) ; if (null? tree)
        (goto (reg continue))
      not-pair
        (assign val (op +) (reg n) (const 1)) ; if (not (pair? tree))
        (goto (reg continue))
      cl-done)))


(set-register-contents! cl-iter-machine 'tree (cons a a))
(start cl-iter-machine)
(get-register-contents cl-iter-machine 'val)

