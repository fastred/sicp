(define count 0)
(define (id x)
  (set! count (+ count 1))
  x)

; Expression in the definition is evaluated. It is an application so
; enclosing 'id' is evaluated. 'count' is set to 1.

(define w (id (id 10)))
;;; L-Eval input:
count
;;; L-Eval value:
1

; This call has to return 'x' (as defined in 'id' procedure). In this case 'x'
; equals to '(id 10)'. This procedure is called, it sets 'count' to 2, returns 10,
; and then outer 'id' returns 10.

;;; L-Eval input:
w
;;; L-Eval value:
10
;;; L-Eval input:
count
;;; L-Eval value:
2

