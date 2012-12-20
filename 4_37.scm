; Ben's right. This solution has two optimizations:
; 1) It checks whether sum of squares isn't greater than the square of the highest
; number in the given interval.
; 2) It doesn't search for all possible values of 'k'. Instead it checks if
; square root of the sum of squares is an integer. If it is, then by 1) it must
; be a correct solution.
