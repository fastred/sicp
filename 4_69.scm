(load "ch4-4-setup.scm")
(run '(assert! (son Adam Cain)))
(run '(assert! (son Cain Enoch)))
(run '(assert! (son Enoch Irad)))
(run '(assert! (son Irad Mehujael)))
(run '(assert! (son Mehujael Methushael)))
(run '(assert! (son Methushael Lamech)))
(run '(assert! (wife Lamech Ada)))
(run '(assert! (son Ada Jabal)))
(run '(assert! (son Ada Jubal)))
(run '(assert!
        (rule (grandson ?gf ?gs)
              (and (son ?gf ?f) (son ?f ?gs)))))
(run '(assert!
        (rule (son ?m ?s)
              (and (wife ?m ?w) (son ?w ?s)))))
(run '(assert!
        (rule (last-pair (?x) (?x)))))
(run '(assert!
        (rule (last-pair (?y . ?z) ?x)
              (last-pair ?z ?x))))

; In the next rule we operate on lists, so it is helpful to have this relationship's
; name in a list format.
(run '(assert!
        (rule ((grandson) ?gf ?gs)
              (grandson ?gf ?gs))))
(run '(assert!
        (rule ((great . ?rel) ?x ?y)
              (and (son ?x ?son)
                   (?rel ?son ?y)
                   (last-pair ?rel (grandson))))))

(run '(?relationship Adam Irad))
;((great grandson) adam irad)
(run '((great grandson) Adam ?x))
;((great grandson) adam irad)
(run '((great grandson) ?g ?ggs))
;((great grandson) mehujael jubal)
;((great grandson) irad lamech)
;((great grandson) mehujael jabal)
;((great grandson) enoch methushael)
;((great grandson) cain mehujael)
;((great grandson) adam irad)
