; This file is used to save me some typing into the interpreter.
(define (load-definition input)
  (define (internal-loop try-again)
    (if (eq? input 'try-again)
      (try-again)
      (begin
        (ambeval input
                 the-global-environment
                 ;; ambeval success
                 (lambda (val next-alternative) '())
                 ;; ambeval failure
                 (lambda ()
                   (announce-output
                     ";;; There are no more values of")
                   (user-print input))))))
  (internal-loop
    (lambda ()
      (newline)
      (display ";;; There is no current problem"))))

(define the-global-environment (setup-environment))

(load-definition '(define (require p)
  (if (not p) (amb))))

(load-definition '(define (an-element-of items)
  (require (not (null? items)))
  (amb (car items) (an-element-of (cdr items)))))

(load-definition '(define (a-random-element-of items)
  (require (not (null? items)))
  (ramb (car items) (a-random-element-of (cdr items)))))

(load-definition '(define (a-random-integer-starting-from n)
  (ramb n (a-random-integer-starting-from (+ n 1)))))

(load-definition '(define (a-random-integer-between low high)
  (if (not (>= low high))
    (ramb low (a-random-integer-between (+ low 1) high))
    low)))

(load-definition '(define (test-randomization)
           (let ((a (a-random-integer-between 1 10)))
             (require (> a 0))
             a)))
(load-definition '(define (square x) (* x x)))

(load-definition '(define (smallest-divisor n)
  (find-divisor n 2)))

(load-definition '(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        (( divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1))))))

(load-definition '(define (divides? a b)
  (= (remainder b a) 0)))

(load-definition '(define (prime? n)
  (= n (smallest-divisor n))))

(load-definition '(define (prime-sum-pair list1 list2)
  (let ((a (an-element-of list1))
        (b (an-element-of list2)))
    (require (prime? (+ a b)))
    (list a b))))


;(driver-loop)
