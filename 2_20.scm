(define (same-parity a . b)
  (let ((comparator (if (even? a) even? odd?)))
    (append (list a) (filter comparator b))))

