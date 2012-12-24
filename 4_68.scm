(load "ch4-4-setup.scm")

(run '(assert!
        (rule (append-to-form () ?y ?y))))
(run '(assert!
        (rule (append-to-form (?u . ?v) ?y (?u . ?z))
              (append-to-form ?v ?y ?z))))

(run '(assert!
        (rule (reverse (?el) (?el)))))
(run '(assert!
        (rule (reverse (?head . ?tail) ?result)
                       (and (reverse ?tail ?tail-reversed)
                            (append-to-form ?tail-reversed (?head) ?result)))))

(run '(reverse (1 2 3) ?x))
; (reverse (1 2 3) (3 2 1))

(run '(reverse ?x (1)))
; It doesn't work in this direction. Evaluation never terminates.
