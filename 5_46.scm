(load "load-eceval-compiler.scm")
(load "5_33.scm")

(define (compile-and-go expression)
  (let ((instructions
          (assemble (statements
                      (compile expression 'val 'return))
                    eceval)))
    (set! the-global-environment (setup-environment))
    (set-register-contents! eceval 'val instructions)
    (set-register-contents! eceval 'flag true)
    (start eceval)))

(compile-and-go
  '(define (fib n)
     (if (< n 2)
       n
       (+ (fib (- n 1)) (fib (- n 2))))))

Stack usage in compiled fib:
(fib 1)
(total-pushes = 7 maximum-depth = 3)

(fib 2)
(total-pushes = 17 maximum-depth = 5)

(fib 3)
(total-pushes = 27 maximum-depth = 8)

(fib 4)
(total-pushes = 47 maximum-depth = 11)

(fib 5)
(total-pushes = 77 maximum-depth = 14)

(fib 6)
(total-pushes = 127 maximum-depth = 17)

Maximum depth: 3n - 1

Number of pushes:
We've got a set of equations:
S(3) = aFib(4) + b
S(4) = aFib(5) + b

after substitution we get
27 = 3a + b
47 = 5a + b

We solve it and find that:
S(n) = 10Fib(n+1) - 3



Stack usage in special-purpose machine:
fib-machine 1
(total-pushes = 0 maximum-depth = 0)

fib-machine 2
(total-pushes = 4 maximum-depth = 2)

fib-machine 3
(total-pushes = 8 maximum-depth = 4)

fib-machine 4
(total-pushes = 16 maximum-depth = 6)

fib-machine 5
(total-pushes = 28 maximum-depth = 8)

fib-machine 6
(total-pushes = 48 maximum-depth = 10)

fib-machine 7
(total-pushes = 80 maximum-depth = 12)

Maximum depth: 2n-2

Number of pushes:
We've got a set of equations:
S(3) = aFib(4) + b
S(4) = aFib(5) + b

after substitution we get
8 = 3a + b
16 = 5a + b

We solve it and find that:
S(n) = 4Fib(n+1) - 4



Summary:
                                      Maximum depth   Number of pushes
Ratio of compiled/special-purpose       3/2                5/2
