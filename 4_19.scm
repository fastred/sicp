;I agree with Alyssa's approach (also chosen by mit-scheme's authors), because it's
;consistent with the way procedure's definitions are scanned.
;Example in the exercise is quite simple. In it it would be sufficient to move the
;definition of 'a' before the definition of 'b'. Then 'set! a' would be executed
;before 'set! b'
