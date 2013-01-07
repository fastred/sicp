1. saves and restores the env register around the evaluation of the operator
2. saves and restores env around the evaluation of each operand (except the final one)
3. saves and restores argl around the evaluation of each operand
4. saves and restores proc around the evaluation of the operand sequence

(f 'x 'y)
1-4 can be safely removed

((f) 'x 'y)
1-4 can be removed because f doesn't take any arguments.

(f (g 'x) y)
1 can be removed. We need 3 and 4 because of an application of g.
We also need 2 because the application of g could interfere with current environment.
Compound procedure application is done via ev-sequence, which saves and restores
env between evaluation of every expression, besides the last one. So if the last
expression in the definition of g were to include for example (define y 1) it would
change the value returned by this expression.

(f (g 'x) 'y)
Last argument in an application is a symbol so we don't need 2. We also don't
need 1.

