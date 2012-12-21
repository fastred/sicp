(load "ch4-ambeval.scm")

(define (analyze exp)
  (cond ((self-evaluating? exp) 
         (analyze-self-evaluating exp))
        ((quoted? exp) (analyze-quoted exp))
        ((variable? exp) (analyze-variable exp))
        ((assignment? exp) (analyze-assignment exp))
        ((perm-assignment? exp) (analyze-perm-assignment exp))
        ((definition? exp) (analyze-definition exp))
        ((if? exp) (analyze-if exp))
        ((if-fail? exp) (analyze-if-fail exp))
        ((lambda? exp) (analyze-lambda exp))
        ((begin? exp) (analyze-sequence (begin-actions exp)))
        ((cond? exp) (analyze (cond->if exp)))
        ((let? exp) (analyze (let->combination exp))) ;**
        ((amb? exp) (analyze-amb exp))                ;**
        ((application? exp) (analyze-application exp))
        (else
         (error "Unknown expression type -- ANALYZE" exp))))

(define (if-fail? exp) (tagged-list? exp 'if-fail))
(define if-fail-proc cadr)
(define (if-fail-symbol exp) (caddr exp))
(define (analyze-if-fail exp)
  (let ((proc (analyze (if-fail-proc exp)))
        (failure (analyze (if-fail-symbol exp))))
    (lambda (env succeed fail)
      (proc env
            succeed
            (lambda () (succeed (failure env succeed fail) fail))))))

(define (perm-assignment? exp) (tagged-list? exp 'permanent-set!))
(define (analyze-perm-assignment exp)
  (let ((var (assignment-variable exp))
        (vproc (analyze (assignment-value exp))))
    (lambda (env succeed fail)
      (vproc env
             (lambda (val fail2)        ; *1*
               (let ((old-value
                      (lookup-variable-value var env))) 
                 (set-variable-value! var val env)
                 (succeed 'ok
                          (lambda () (fail2)))))
             fail))))

;(load "ch4-3-setup-repl.scm")
;(driver-loop)
