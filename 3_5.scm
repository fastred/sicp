(load "ch3support.scm")

(define random-init 7)
(define rand
  (let ((x random-init))
    (lambda ()
      (set! x (rand-update x))
      x)))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))
(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (define (experiment)
    (P (random-in-range x1 x2) (random-in-range y1 y2)))
  (* (* (- x2 x1) (- y2 y1)) (monte-carlo trials experiment)))

; area of a circle with radius 2 (needs floating point numbers to more accurate)
(define area (estimate-integral (lambda (x y) (<= (+ (* x x) (* y y)) 4)) -5 5 -5 5 5000))
(define pi (/ area 4))
