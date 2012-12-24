(load "ch4-4-setup.scm")

(run '(assert!
        (rule (last-pair (?x) (?x)))))
(run '(assert!
        (rule (last-pair (?y . ?z) ?x)
              (last-pair ?z ?x))))
(run '(last-pair (3) ?x))
;(last-pair (3) (3))
(run '(last-pair (1 2 3) ?x))
;(last-pair (1 2 3) (3))
(run '(last-pair (2 ?x) (3)))
;(last-pair (2 3) (3))
(run '(last-pair ?x (3)))
;it doesn't halt because there's infinitely many solutions.
