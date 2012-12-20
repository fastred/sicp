; Wrong version. It backtracks only to 'k' variable and increments it.
; There're no solutions in the form of 1 1 k, where k is a natural number.
(define (a-pythagorean-triple-starting-from low)
  (let ((i (an-integer-starting-from low)))
    (let ((j (an-integer-starting-from i)))
      (let ((k (an-integer-starting-from j)))
        (require (= (+ (* i i) (* j j)) (* k k)))
        (list i j k)))))


; We observe that pythagorean triples hold a property: i<=j<=k. We start from 'k', and
; search for 'j' which is between 'low' and 'k', then we search for 'i' which is between
; 'low' and 'j'. It's not the most optimal solution because for every 'k' it checks
; all proper combinations of 'i' and 'j'.
(define (a-pythagorean-triple-starting-from low)
  (let ((k (an-integer-starting-from low)))
    (let ((j (an-integer-between low k)))
      (let ((i (an-integer-between low j)))
        (require (= (+ (* i i) (* j j)) (* k k)))
        (list i j k)))))

