(load "ch3support.scm")
(load "3_56.scm")
(define (display-stream s)
  (stream-for-each display-line s))
(define (display-line x)
  (newline)
  (display x))
(define random-init 7)
(define random-numbers
  (cons-stream random-init
               (stream-map rand-update random-numbers)))
(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))
(define (monte-carlo experiment-stream passed failed)
  (define (next passed failed)
    (cons-stream
     (/ passed (+ passed failed))
     (monte-carlo
      (stream-cdr experiment-stream) passed failed)))
  (if (stream-car experiment-stream)
      (next (+ passed 1) failed)
      (next passed (+ failed 1))))

(define (estimate-integral P x1 x2 y1 y2)
  (define (integral-stream P x1 x2 y1 y2)
    (cons-stream 
      (P (random-in-range x1 x2) (random-in-range y1 y2))
      (integral-stream P x1 x2 y1 y2)))
  (stream-map (lambda (hits) (* (* (- x2 x1) (- y2 y1)) hits))
              (monte-carlo (integral-stream P x1 x2 y1 y2) 0 0)))

(define circle-area (estimate-integral (lambda (x y) (<= (+ (* x x) (* y y)) 4)) -5 5 -5 5))
; equals about 64
(define rectangle-area (estimate-integral (lambda (x y) (and (<= x 4) (> x -4) (<= y 4) (> y -4)))
                                            -5 5 -5 5))

(define pi (scale-stream circle-area (/ 1 4)))
