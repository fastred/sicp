(load "4_3.scm")

(define (eval-and exps env)
  (define (eval-and-rec exps)
    (if (null? exps)
      true
      (let ((current (eval (car exps) env)))
        (if (false? current)
          false
          (if (null? (cdr exps))
            current
            (eval-and-rec (cdr exps)))))))
  (eval-and-rec (cdr exps)))

(define (eval-or exps env)
  (define (eval-or-rec exps)
    (if (null? exps)
      false
      (if (true? (eval (car exps) env))
        true
        (eval-or-rec (cdr exps)))))
  (eval-or-rec (cdr exps)))

(define the-global-environment (setup-environment))
(puteval 'and eval-and)
(puteval 'or eval-or)

;(eval '(and 'true (= 1 1) 3 ) the-global-environment)
;(eval '(or (= 1 2) false) the-global-environment)
