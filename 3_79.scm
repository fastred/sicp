(load "3_73.scm")

(define (integral delayed-integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (let ((integrand (force delayed-integrand)))
                   (add-streams (scale-stream integrand dt)
                                int))))
  int)

(define (solve-2nd f-a f-b dt y0 dy0)
  (define y (integral (delay dy) y0 dt))
  (define dy (integral (delay ddy) dy0 dt))
  (define ddy (stream-map + (stream-map f-a dy) (stream-map f-b y)))
  y)

;(stream-ref (solve-2nd (lambda (x) 0) (lambda (x) x) 0.001 1 1) 1000)

