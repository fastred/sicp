(load "ch4-4-setup.scm")

(run '(assert! (meeting accounting (Monday 9am))))
(run '(assert! (meeting administration (Monday 10am))))
(run '(assert! (meeting computer (Wednesday 3pm))))
(run '(assert! (meeting administration (Friday 1pm))))
(run '(assert! (meeting whole-company (Wednesday 4pm))))

; a)
(run '(meeting ?division (Friday ?time)))

; b)
(run '(assert!
        (rule (meeting-time ?person ?day-and-time)
              (and (job ?person (?division . ?t))
                   (or (meeting ?division ?day-and-time)
                       (meeting whole-company ?day-and-time))))))

(run '(meeting-time (Aull DeWitt) ?datetime))

; c)
(run '(meeting-time (Hacker Alyssa P) (Wednesday ?time)))
