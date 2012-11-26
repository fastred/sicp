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

(define (triples s t u)
  (cons-stream
    (list (stream-car s) (stream-car t) (stream-car u))
    (interleave
      (stream-map (lambda (x) (cons (stream-car s) x))
                    (pairs t u))
      (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(define int-triples (triples integers integers integers))
(define pythagorean-triples
  (stream-filter (lambda (x) (= (+ (square (car x)) (square (cadr x)))
                                (square (caddr x))))
                 int-triples))
(stream-ref pythagorean-triples 0)
(stream-ref pythagorean-triples 1)
(stream-ref pythagorean-triples 2)
