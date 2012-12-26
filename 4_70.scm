; New definition would just create an ifinite stream consisting of 'assertion'.
; Values stored in 'THE-ASSERTIONS' would be lost.
; To escape this situation we need to create a new pointer to 'THE-ASSERTIONS',
; that's why we use 'let'.

