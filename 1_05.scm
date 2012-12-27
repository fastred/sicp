(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; Using applicative-order evaluation system will go into an infinite loop, because
; procedure p will be called during application of 'test'. 'p' is a recursive 
; procedure that calls itself repeatedly.
;
; Using normal-order evaluation this expression will return 0.

