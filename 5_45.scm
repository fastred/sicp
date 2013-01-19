a) Compiled factorial stack usage:

(factorial 2)
(total-pushes = 13 maximum-depth = 5)

(factorial 3)
(total-pushes = 19 maximum-depth = 8)

(factorial 4)
(total-pushes = 25 maximum-depth = 11)

(factorial 5)
(total-pushes = 31 maximum-depth = 14)

(factorial 6)
(total-pushes = 37 maximum-depth = 17)

Maximum depth: 3n - 1
Number of pushes: 6n + 1

                                 Maximum depth   Number of pushes
Ratio compiled/interpreted          3/5             3/16 
Ratio special-purpose/interpreted   2/5             1/16



b) Optimization presented in exercixe 5.38 is quite good:

(factorial 2)
(total-pushes = 11 maximum-depth = 4)

(factorial 3)
(total-pushes = 15 maximum-depth = 6)

(factorial 4)
(total-pushes = 19 maximum-depth = 8)

(factorial 5)
(total-pushes = 23 maximum-depth = 10)


Maximum depth: 2n
Number of pushes: 4n + 3

                                          Maximum depth   Number of pushes
Ratio compiled(with 5.38)/interpreted          2/5             2/16
