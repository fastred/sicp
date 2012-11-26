(define (add-streams s1 s2)
  (stream-map + s1 s2))
(define (mul-streams s1 s2)
  (stream-map * s1 s2))
(define ones (cons-stream 1 ones))
(define integers (cons-stream 1 (add-streams ones integers)))

(define inverses (stream-map (lambda (x) (/ 1 x)) integers))

(define (integrate-series stream)
  (cons-stream (stream-car stream)
               (mul-streams (stream-cdr inverses) (stream-cdr stream))))

(define exp-series
  (cons-stream 1 (integrate-series exp-series)))

(define cosine-series
  (cons-stream 1 (integrate-series (stream-map - sine-series))))
(define sine-series
  (cons-stream 0 (integrate-series cosine-series)))
