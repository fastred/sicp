;z equals (cons 'complex (cons 'rectangular (cons 3 4)))
(magnitude z)
(apply-generic 'magnitude z)
(magnitude (contents z))
(magnitude (cons 'rectangular (cons 3 4)))
(apply-generic 'magnitude (cons 'rectangular (cons 3 4)))
(magnitude (cons 3 4)) ; from rectangular package
(sqrt (+ (square (real-part (cons 3 4)))
         (square (imag-part (cons 3 4)))))
(sqrt (+ (square (car (cons 3 4)))
         (square (cdr (cons 3 4)))))
(sqrt (+ (square 3)
         (square 4)))
(sqrt (+ 9 16))
(sqrt 25)
5

