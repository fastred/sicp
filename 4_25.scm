; a) applicative-order language
; Procedure 'factorial' uses 'unless' and passes as a second parameter expression
; '(* n (factorial (- n 1)))'. Arguments of 'unless' are evaluated during a call, so
; 'factorial' is called. But it uses 'unless' so this evaluation goes into never-ending
; recursion.
;
; b) normal-order language
; It'll work fine in.
