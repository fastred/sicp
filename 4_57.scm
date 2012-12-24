(load "ch4-4-setup.scm")

(run '(assert!
  (rule (can-replace ?person-1 ?person-2)
        (and (job ?person-2 ?p-2-job)
             (or (job ?person-1 ?p-2-job)
                 (and (job ?person-1 ?p-1-job) (can-do-job ?p-1-job ?p-2-job)))
             (not (same ?person-1 ?person-2))))))

; Solution:
(run '(can-replace ?p (Fect Cy D)))
(run '(and (can-replace ?p1 ?p2)
     (salary ?p1 ?s1)
     (salary ?p2 ?s2)
     (lisp-value < ?s1 ?s2)))

