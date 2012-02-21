(define (make-from-mag-ang mag ang)
  (define (dispatch op)
    (cond ((eq? op 'real-part) (* mag (cos ang)))
          ((eq? op 'imag-part) (* mag (sin ang)))
          ((eq? op 'magnitude) mag)
          ((eq? op 'angle) ang)
          (else
            (error "Operation not found -- MAKE-FROM-MAG-ANG" op))))
  dispatch)

(define z (make-from-mag-ang 3 30))
(z 'real-part)
