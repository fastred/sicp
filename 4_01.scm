(load "ch4-mceval.scm")

(define (list-of-values-l2r exps env)
  (if (no-operands? exps)
      '()
      (let ((left (eval (first-operand exps) env)))
        (cons left
              (list-of-values-l2r (rest-operands exps) env)))))

(define (list-of-values-r2l exps env)
  (if (no-operands? exps)
      '()
      (let ((right (list-of-values-r2l (rest-operands exps) env)))
        (cons (eval (first-operand exps) env)
              right))))

;(define the-global-environment (setup-environment))
;(eval '(define x 1) the-global-environment)
;(define test '((set! x (+ x 1)) (set! x (* x 2))))
;(list-of-values-l2r test the-global-environment)
;or
;(list-of-values-r2l test the-global-environment)
;(eval 'x the-global-environment)

