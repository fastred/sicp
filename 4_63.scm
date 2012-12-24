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

(run '(grandson Adam ?x))
;(grandson adam enoch
(run '(son Lamech ?x))
;(son lamech jubal)
;(son lamech jabal)
(run '(grandson Methushael ?x))
;(grandson methushael jubal)
;(grandson methushael jabal)

