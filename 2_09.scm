Let's assume that we have two intervals:
(define a (make-interval c d))
(define b (make-interval e f))
(define a-width (/ (- d c) 2)) ; (d - c) / 2
(define b-width (/ (- f e) 2)) ; (f - e) / 2


a) Addition

Width of (add-interval a b) equals to (in infix notation):
((d + f) - (c + e)) / 2
(d + f - c - e) / 2
(d - c + f - e) / 2
(d - c) / 2 + (f - e) / 2
a_width + b_width


b) Multiplication

Width of (mul-interval a b) equals to:
(max((c * e) (c * f) (d * e) (d * f)) - min((c * e) (c * f) (d * e) (d * f))) / 2


It's not clear whether we can transform this expression to the form based only on
a_width and b_width.
As a counterexample we can find two pairs of intervals of the same widths and see whether
widths of results are the same.


(mul-interval (make-interval 1 2)
              (make-interval 2 3))
; (2 . 6) -- width 2

(mul-interval (make-interval 2 3)
              (make-interval 3 4))
; (6 . 12) -- width 3

