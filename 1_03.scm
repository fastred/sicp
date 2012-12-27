(define (square a) (* a a))
(define (sum-of-squares a b)
  (+ (square a) (square b)))

(define (f a b c)
  (if (<= a b)
    (if (<= b c)
      (sum-of-squares a b)
      (sum-of-squares a c))
    (if (<= c a)
      (sum-of-squares b c)
      (sum-of-squares a b))))

(f 1 2 3)
; 5
(f 1 3 2)
; 5
(f 2 1 3)
; 5
(f 2 3 1)
; 5
(f 3 1 2)
; 5
(f 3 2 1)
; 5

