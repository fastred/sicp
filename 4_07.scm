(load "4_6.scm")

(define (let*->nested-lets exp env)
  (eval(expand-let* exp) env))

(define (expand-let* exp)
  (define (expand-let*-rec bindings)
    (if (null? bindings)
      (let-body exp)
      (expand-let (cons (car bindings) '()) (expand-let*-rec (cdr bindings)))))
  (expand-let*-rec (let-bindings exp)))
    
(puteval 'let* let*->nested-lets)

; test
;(define the-global-environment (setup-environment))
;(eval '(let* ((x 3))
  ;(* x 2)) the-global-environment)

;(eval '(let* ((x 3)
       ;(y (+ x 2))
       ;(z (+ x y 5)))
  ;(* x z)) the-global-environment)

