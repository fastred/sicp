(define (up-split painter n)
  (if (= n 0)
    painter
    (let ((smaller (right-split painter (- n 1))))
      (below painter (beside smaller smaller)))))
