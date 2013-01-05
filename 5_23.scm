(define (let? exp) (tagged-list? exp 'let))
(define (let-bindings exp)
  (cadr exp))
(define (let-body exp)
  (cddr exp))
(define (let-vars bindings)
  (map car bindings))
(define (let-values bindings)
  (map cadr bindings))
(define (expand-let bindings body)
  (append (list (make-lambda (let-vars bindings) body))
          (let-values bindings)))
(define (let->lambda exp)
  (expand-let (let-bindings exp) (let-body exp)))

; Changes:
;
;(define eceval-operations
  ;(list
   ;; ...
   ;; ...
   ;(list 'cond? cond?)
   ;(list 'cond->if cond->if)
   ;(list 'let? let?)
   ;(list 'let->lambda let->lambda)
   ;))

;(define eceval
  ;(make-machine
    ;; ...
    ;; ...
;eval-dispatch
    ;; ...
  ;(test (op cond?) (reg exp))
  ;(branch (label cond->if))
  ;(test (op let?) (reg exp))
  ;(branch (label let->lambda))
    ;; ...
;cond->if
  ;(assign exp (op cond->if exp) (reg exp))
  ;(goto (label eval-dispatch))
;let->lambda
  ;(assign exp (op let->lambda exp) (reg exp))
  ;(goto (label eval-dispatch))
    ;; ...
