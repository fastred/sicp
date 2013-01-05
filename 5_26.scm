(load "load-eceval.scm")

(define the-global-environment (setup-environment))

(start eceval)

;My results:
;(factorial 1)
;(total-pushes = 64 maximum-depth = 10)

;(factorial 2)    
;(total-pushes = 99 maximum-depth = 10)

;(factorial 3)
;(total-pushes = 134 maximum-depth = 10)

;a) depth always equals 10
;b) number of pushes: f(n) = 35n + 29

