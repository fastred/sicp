My results:
(fib 1)
(total-pushes = 16 maximum-depth = 8)

(fib 2)
(total-pushes = 72 maximum-depth = 13)

(fib 3)
(total-pushes = 128 maximum-depth = 18)

(fib 4)
(total-pushes = 240 maximum-depth = 23)

(fib 5)
(total-pushes = 408 maximum-depth = 28)


a) depth is given by f(n) = 5n + 3
b) assignment says that S(n) = aS(n-1) + bS(n-2) + k
we have:
S(3) = aS(2) + bS(1) + k
S(4) = aS(3) + bS(2) + k
S(5) = aS(4) + bS(3) + k

After substitution we have:
128 = 72a + 16b + k
240 = 128a + 72b + k
408 = 240a + 128b + k

It's a system of 3 equations with 3 unknowns so it's easily solvable,
we get:
a = 1
k = 40
b = 1
Formula for S(n):
S(n) = S(n-1) + S(n-2) + 40


Next part asks us to give formula in a form of S(n) = aFib(n+1) + b
We have:
S(3) = aFib(4) + b
S(4) = aFib(5) + b

after substitution we get
128 = 3a + b
240 = 5a + b

We solve it and find that:
S(n) = 56Fib(n+1) - 40

