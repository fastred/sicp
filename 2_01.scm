(define (make-rat n d)
  (let ((g (gcd n d)))
    (let ((numer (/ n g))
          (denom (/ d g)))
      (cond ((or (and (< numer 0) (< denom 0)) (and (>= numer 0) (< denom 0)))
             (cons (- numer) (- denom)))
            (else (cons numer denom))))))

