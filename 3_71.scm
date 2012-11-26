(load "3_70.scm")
(define cube (lambda (x) (* x x x)))
(define ram-weight (lambda (x) (+ (cube (car x)) (cube (cadr x)))))
(define pairs-sorted-by-ram (weighted-pairs integers integers ram-weight))
(define (same-weight-pairs possible-pairs last-weight weight-fun)
  (let* ((pair (stream-car possible-pairs))
        (weight (weight-fun pair)))
    (if (stream-null? possible-pairs)
      the-empty-stream
      (if (= weight last-weight)
        (cons-stream pair (same-weight-pairs (stream-cdr possible-pairs) weight weight-fun))
        (same-weight-pairs (stream-cdr possible-pairs) weight weight-fun)))))
(define ramanujan-numbers (stream-map ram-weight
                                      (same-weight-pairs pairs-sorted-by-ram 0 ram-weight)))

(stream-ref ramanujan-numbers 0)
(stream-ref ramanujan-numbers 1)
(stream-ref ramanujan-numbers 2)
