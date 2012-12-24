a) System finds that 'outranked-by' rule is applicable. Frame is produced in which
'?staff-person' is bound to '(Bitdiddle Ben)' and '?boss' is bound to '?who'.
Interpreter evaluates the rule body. System finds that:
'(supervisor (Bitdiddle Ben) ?who)'
is satisfied by ?who equals (Warbucks Oliver). This result is added to the
output stream of frames.

b) In parallel with a) system evaluates 'and' form. It applies:
'(outranked-by ?middle-manager ?who)'
Now evaluation basically repeats (besides different bindings), and goes into
infinite loop because of the calls to 'outranked-by'.

