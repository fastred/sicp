(define (make-vect x y)
  (list x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cadr v))

(define (add-vect v w)
  (map + v w))

(define (sub-vect v w)
  (map - v w))

(define (scale-vect scalar v)
  (map (lambda (x) (* x scalar)) v))

; OR

(define (add-vect v w)
  (make-vect (+ (xcor-vect v) (xcor-vect w))
             (+ (ycor-vect v) (ycor-vect w))))

(define (scale-vect scalar v)
  (make-vect (* scalar (xcor-vect v))
             (* scalar (ycor-vect v))))

(define (sub-vect v w)
  (add-vect v (scale-vect -1 w)))

(define x (make-vect 1 3))

;(xcor-vect x)
;(ycor-vect x)
;(add-vect x x)
;(sub-vect x (make-vect 1 1))
;(scale-vect 5 x)

