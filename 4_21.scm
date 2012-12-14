((lambda (n)
   ((lambda (fact)
      (fact fact n))
    (lambda (ft k)
      (if (= k 1)
          1
          (* k (ft ft (- k 1)))))))
 10)

((lambda (n)
   ((lambda (fib)
      (fib fib n))
    (lambda (fb k)
      (cond ((= k 0)
             0)
            ((= k 1)
             1)
            (else (+ (fb fb (- k 1)) (fb fb (- k 2))))))))
 11)


(define (f x)
  ((lambda (even? odd?)
     (even? even? odd? x))
   (lambda (ev? od? n)
     (if (= n 0) true (od? ev? od? (- n 1))))
   (lambda (ev? od? n)
     (if (= n 0) false (ev? ev? od? (- n 1))))))

;test
;(f 5)
;(f 6)

