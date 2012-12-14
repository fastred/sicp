(define (solve f y0 dt)
  (define y (integral (delay dy) y0 dt))
  (define dy (stream-map f y))
  y)

;is transformed to:

(define solve
  (lambda (f y0 dt)
    (let ((y '*unassigned*)
          (dy '*unassigned*))
      (let ((a (integral (delay dy) y0 dt))
            (b (stream-map f y)))
        (set! y a)
        (set! dy b))
      y)))

; which in turn is transformed to:

(define solve
  (lambda (f y0 dt)
    (lambda (y dy)
      (lambda (a b)
        (set! y a)
        (set! dy b)
        y) (integral (delay dy) y0 dt) (stream-map f y)) '*unassigned* '*unassigned*))

; We can see that y equals '*unassigned* when stream-map is applied to it.


; If we scan as presented in the text we get:

(define solve
  (lambda (f y0 dt)
    (let ((y '*unassigned*)
          (dy '*unassigned*))
      (set! y (integral (delay dy) y0 dt))
      (set! dy (stream-map f y))
      y)))

; which is then transformed to:

(define solve
  (lambda (f y0 dt)
    (lambda (y dy)
      (set! y (integral (delay dy) y0 dt))
      (set! dy (stream-map f y))
      y) '*unassigned* '*unassigned*))

; This method will work fine.
