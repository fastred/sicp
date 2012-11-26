(load "3_60.scm")
(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))
(define (invert-unit-series series)
  (cons-stream 1
               (scale-stream (mul-streams (stream-cdr series)
                                          (invert-unit-series series))
                             -1)))

