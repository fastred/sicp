(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (display "sin\n")
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))
(p -0.7895631144708228)
(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.35)))
(p (p (p (sine 0.45))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine 0.05))))))
(p (p (p (p .14950000000000002))))
(p (p (p .43513455050000005)))
(p (p .9758465331678772))
(p -0.7895631144708228)
-.39980345741334

; 'p' is applied 5 times.
; Both space and number of steps complexities of this procedure are equal to O(logn).
