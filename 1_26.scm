We can describe recursion in the new version by the equation
T(n) = T(n/2) + T(n/2) + C = 2T(n/2) + C.

Using Master's Theorem notation, we have
a = 2,
b = 2,
d = 0.

By Master Theorem we get:
T(n) = O(n^(log_b(a)))
we see that
log_b(a) = 1
In the end we find that:
T(n) = O(n).
