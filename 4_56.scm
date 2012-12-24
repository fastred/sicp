(load "ch4-4-setup.scm")

; a)
(run '(and (supervisor ?person (Bitdiddle Ben))
     (address ?person ?address)))
; b)
(run '(and (salary ?person ?amount) (salary (Bitdiddle Ben) ?bens-salary)
     (lisp-value < ?amount ?bens-salary)))
; c)
(run '(and (supervisor ?person ?supervisor) (not (job ?supervisor (computer . ?type)))
     (job ?supervisor ?supervisor-job)))

