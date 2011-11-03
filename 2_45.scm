(define (split first second)
  (define (rec-split painter n)
    (if (= n 0)
      painter
      (let ((smaller (rec-split painter (- n 1))))
        (first painter (second smaller smaller))))))
