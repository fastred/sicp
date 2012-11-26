(load "3_55.scm")
(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))
(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))
(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))
(define (merge s1 s2)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car (stream-car s1))
               (s2car (stream-car s2)))
           (cond ((< s1car s2car)
                  (cons-stream s1car (merge (stream-cdr s1) s2)))
                 ((> s1car s2car)
                  (cons-stream s2car (merge s1 (stream-cdr s2))))
                 (else
                  (cons-stream s1car
                               (merge (stream-cdr s1)
                                      (stream-cdr s2)))))))))

(define (merge-weighted s1 s2 weight)
  (define (merge s1 s2)
    (cond ((stream-null? s1) s2)
          ((stream-null? s2) s1)
          (else
            (let ((s1car (stream-car s1))
                  (s2car (stream-car s2)))
              (if (< (weight s1car) (weight s2car))
                (cons-stream (stream-car s1) (merge (stream-cdr s1) s2))
                (cons-stream (stream-car s2) (merge s1 (stream-cdr s2))))))))
  (merge s1 s2))
(define (weighted-pairs s t weight)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (merge-weighted
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (weighted-pairs (stream-cdr s) (stream-cdr t) weight) weight)))

(define part-a (weighted-pairs integers integers (lambda (x) (+ (car x) (cadr x)))))

(define int-235 (stream-filter (lambda (x) (not (or (= (remainder x 2) 0)
                                                    (= (remainder x 3) 0)
                                                    (= (remainder x 5) 0))))
                               integers))
(define weight235 (lambda (x) (+ (* 2 (car x)) (* 3 (cadr x)) (* 5 (car x)))))
(define part-b (weighted-pairs int-235 int-235 weight235))

