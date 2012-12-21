(load "ch4-ambeval.scm")

(define (analyze exp)
  (cond ((self-evaluating? exp) 
         (analyze-self-evaluating exp))
        ((quoted? exp) (analyze-quoted exp))
        ((variable? exp) (analyze-variable exp))
        ((assignment? exp) (analyze-assignment exp))
        ((definition? exp) (analyze-definition exp))
        ((if? exp) (analyze-if exp))
        ((lambda? exp) (analyze-lambda exp))
        ((begin? exp) (analyze-sequence (begin-actions exp)))
        ((cond? exp) (analyze (cond->if exp)))
        ((let? exp) (analyze (let->combination exp))) ;**
        ((amb? exp) (analyze-amb exp))                ;**
        ((ramb? exp) (analyze-ramb exp))
        ((application? exp) (analyze-application exp))
        (else
          (error "Unknown expression type -- ANALYZE" exp))))

(define (ramb? exp) (tagged-list? exp 'ramb))
(define (ramb-choices exp) (cdr exp))

(define (analyze-ramb exp)
  (let ((cprocs (map analyze (amb-choices exp))))
    (lambda (env succeed fail)
      (define (try-next choices)
        (if (null? choices)
          (fail)
          (let* ((len (length choices))
                 (choice-num (random (length choices)))
                 (choice (list-ref choices choice-num))
                 (list-beg (take choices choice-num))
                 (list-rest (list-tail choices (+ choice-num 1))))
            (choice env
                    succeed
                    (lambda ()
                      (try-next (append list-beg list-rest)))))))
      (try-next cprocs))))

;(load "ch4-3-setup-repl.scm")
;(driver-loop)

; Here's a very simple example of this feature:
; ((lambda () (amb 1 2 3)))
; returns:
; 1
; 2
; 3
;
; ((lambda () (ramb 1 2 3)))
; returns:
; 2
; 1
; 3
;
; As for Alyssa's problem I've already implemented randomization in the word selection.
