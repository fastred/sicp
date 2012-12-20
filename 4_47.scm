; It does break the program, e.g. for the sentence:
; "the cat eats"
; it returns correct result, but after trying again it goes into never ending loop.
;
; If we change the order of expressions, then program goes into an infinite loop
; without returning any results. It's caused by 'parse-prepositional-phrase'.
; Program fails on it, bactracks, calls it again and then repeats this sequence of
; steps infinitely.

