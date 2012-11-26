(load "3_73.scm")
(define (make-zero-crossings input-stream last-value last-avpt)
  (let ((avpt (/ (+ (stream-car input-stream) last-value) 2)))
    (cons-stream (sign-change-detector avpt last-avpt)
                 (make-zero-crossings (stream-cdr input-stream)
                                      (stream-car input-stream) avpt))))

(define (average x y)
  (/ (+ x y) 2))
(define (smooth stream)
  (if (or (stream-null? stream) (stream-null? (stream-cdr stream))
          (stream-null? (stream-cdr (stream-cdr stream))))
    the-empty-stream
    (cons-stream (average (stream-car (stream-cdr stream))
                          (stream-car (stream-cdr (stream-cdr stream))))
                 (smooth (stream-cdr stream)))))

(define (zero-crossings smoothing sense-data)
  (stream-map sign-change-detector (smoothing sense-data) (cons 0 sense-data)))
