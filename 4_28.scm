;;; L-Eval input: 
(define (identity x) x)
((identity +) 1 2)

; In this example the first argument passed to apply is a thunk instead of a procedure.
