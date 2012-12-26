(assert! (married Minnie Mickey))
(assert! (rule (married ?x ?y)
               (married ?y ?x)))
(married Mickey ?who)

I've found a difference in the behavior of the above example, given in the section
4.4.4 (Infinite loops). With the simplification of the code system now goes
into an infinite loop without printing any results.

Here's an analysis of why it happens:
(married ?y ?x) with bindings (?y Mickey) and (?x ?who) is being matched both by
the assertion and the rule. With delayed evaluation, the result obtained from assertion
was being passed to the output and printed on the screen. Only then
system would force evaluation of the '(apply-rules query-pattern frame)' and go
into an infinite loop. With the change in the code system now tries to find
results both from assertions and rules. But it goes into an infinite loop on
the application of 'apply-rules' and in the upshot doesn't produce any results.

It's analogous for the 'disjoin'. In the old code first result from the first alternative
in the 'or' form would be printed even if system would go into an infinite loop in any
of the remaining expressions.

