(load "3_55.scm")
(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))
(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (interleave
      (stream-map (lambda (x) (list x (stream-car s)))
                  (stream-cdr t))
      (pairs (stream-cdr s) (stream-cdr t))))))

(define a (pairs integers integers))
