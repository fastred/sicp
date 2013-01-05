(load "load-eceval.scm")

(define the-global-environment (setup-environment))

(start eceval)

;My results
;(factorial 1)
;(total-pushes = 16 maximum-depth = 8)

;(factorial 2)
;(total-pushes = 48 maximum-depth = 13)

;(factorial 3)
;(total-pushes = 80 maximum-depth = 18)

;(factorial 4)
;(total-pushes = 112 maximum-depth = 23)

              Maximum depth   Number of pushes
Recursive	        5n + 3	       32n - 16
Iterative	          10           35n + 29	

