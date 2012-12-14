; a) one expression
; Procedure from the text analyzes all expressions, then checks how many expressions
; there's and if there's only one expression returns it.
; Alyssa's procedure also analyzes all expressions, but returns the procedure
; that takes 'environment' as an argument. This procedure checks the length
; of the sequence when it is evaluated.
;
; b) many expressions
; If there's only one expression the difference is minor.
; If we have more expressions then the original version is considerably faster,
; because it returns nested lambdas created from expressions in the sequence.
; On the other hand Alyssa's procedure traverses the sequence of analyzed
; expressions during every evaluation.

