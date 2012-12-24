(load "ch4-4-setup.scm")

(run '(assert!
  (rule (big-shot ?person ?division)
        (and (job ?person (?division . ?t))
             (supervisor ?person ?supervisor)
             (not (job ?supervisor (?division . ?sv-jt)))))))

; Solution:
(run '(big-shot ?person ?division))
