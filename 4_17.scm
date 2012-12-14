;There's an extra frame, because let is transformed to lambda expression, which
;is executed in the new environment.
;It can never make a difference, because variables declared in other parts
;of program are not affected by changes in lambda's new frame.
;Lambda expressions are evaluated when they're applied, so we could just move all
;definitions to the top of the main lambda.
