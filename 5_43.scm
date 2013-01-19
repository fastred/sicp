(load "5_42.scm")

(define (make-let-unassigned definition)
  (list (definition-variable definition) ''*unassigned*))

(define (make-let-set! definition)
  (list 'set! (definition-variable definition) (definition-value definition)))

(define (scan-out-defines body)
  (let ((definitions (filter definition? body))
        (rest-of-body (filter (lambda (a) (not (definition? a))) body)))
    (if (null? definitions)
      body
      (list (cons 'let (cons (map make-let-unassigned definitions)
            (append (map make-let-set! definitions)
                    rest-of-body)))))))

(define (let-bindings exp)
  (cadr exp))
(define (let-body exp)
  (cddr exp))
(define (let->combination exp)
  (expand-let (let-bindings exp) (let-body exp)))
(define (let-vars bindings)
  (map car bindings))
(define (let-values bindings)
  (map cadr bindings))
(define (expand-let bindings body)
  (append (list (make-lambda (let-vars bindings) body))
          (let-values bindings)))

(define (compile-lambda-body exp proc-entry comp-time-env)
  (define scanned-out (car (scan-out-defines (lambda-body exp))))
  (define body
    (if (tagged-list? scanned-out 'let) ; transform only when lambda body contains definitions
      (let->combination scanned-out)
      (lambda-body exp)))
  (let ((formals (lambda-parameters exp)))
    (let ((new-comp-time-env (extend-comp-time-env formals comp-time-env)))
      (append-instruction-sequences
       (make-instruction-sequence '(env proc argl) '(env)
        `(,proc-entry
          (assign env (op compiled-procedure-env) (reg proc))
          (assign env
                  (op extend-environment)
                  (const ,formals)
                  (reg argl)
                  (reg env))))
       (if (tagged-list? scanned-out 'let)
         (compile body 'val 'return new-comp-time-env)
         (compile-sequence body 'val 'return new-comp-time-env))))))

;(define code '(define (test x) (define y 1) (define z 2) (+ x y z)))
;(show-formatted (compile code
                         ;'val
                         ;'next
                         ;empty-comp-time-env))
;(compile-and-go code)

