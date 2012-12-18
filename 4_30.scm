; a) It works correctly because 'display' is a primitive procedures so it forces
; evaluation of 'x'.
; b) In original 'eval-sequence':
; (p1 1) -> (1 2)
; (p2 1) -> 1
; With Cy's 'eval-sequence':
; (p1 1) -> (1 2)
; (p2 1) -> (1 2)
; c) It's been already evaluating correctly, so it doesn't change anything.
; d) I prefer approach from the text because it's more consistent with overall
; behaviour of the lazy evaluator.
