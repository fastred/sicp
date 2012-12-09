(load "4_3.scm")

(define (let-bindings exp)
  (cadr exp))
(define (let-body exp)
  (caddr exp))
(define (let->combination exp env)
  (eval (expand-let (let-bindings exp) (let-body exp)) env))
(define (let-vars bindings)
  (map car bindings))
(define (let-values bindings)
  (map cadr bindings))
(define (let-make-lambda-body body)
  (cons body '()))
(define (expand-let bindings body)
  (append (list (make-lambda (let-vars bindings) (let-make-lambda-body body)))
          (let-values bindings)))
(puteval 'let let->combination)

; test
;(define the-global-environment (setup-environment))
;(eval '(let ((x 1) (y 2)) (+ x y)) the-global-environment)
;(eval '((lambda (x y) (+ x y)) 1 2) the-global-environment)