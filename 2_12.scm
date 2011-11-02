(define (make-interval a b) (cons a b))
(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (percent i)
  (* 100 (/ (- (upper-bound i) (center i)) (center i))))

(define (make-center-percent c p)
  (let ((deviation (* (/ p 100) c)))
    (make-interval (- c deviation) (+ c deviation))))

(define intr (make-center-percent 5 15))
(percent intr)
