(load "ch4-ambeval.scm")

; Input to be copied to Amb-Eval:
(define (require p)
  (if (not p) (amb)))

(define (an-integer-starting-from n)
  (amb n (an-integer-starting-from (+ n 1))))

(define (an-integer-between low high)
  (if (not (>= low high))
    (amb low (an-integer-between (+ low 1) high))
    low))

(define (a-pythagorean-triple-between low high)
  (let ((i (an-integer-between low high)))
    (let ((j (an-integer-between i high)))
      (let ((k (an-integer-between j high)))
        (require (= (+ (* i i) (* j j)) (* k k)))
        (list i j k)))))

; Amb-Eval start
(define the-global-environment (setup-environment))
(driver-loop)
