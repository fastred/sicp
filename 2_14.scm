(load "2_12.scm")
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (div-interval x y)
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define p1 0.001)
(define p2 0.001)
(define c1 3)
(define c2 6)
(define a (make-center-percent c1 p1))
(define b (make-center-percent c2 p2))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1))) 
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(define res (par1 a a))
(center res)
;1.5000000005999998
(percent res)
;2.999999999219334e-3
(define res (par2 a a))
(center res)
;1.5
(percent res)
;1.0000000000065512e-3
(define res (par1 a b))
(center res)
;2.0000000008
(percent res)
;2.9999999991971293e-3
(define res (par2 a b))
(center res)
;2.
(percent res)
;1.0000000000065512e-3

