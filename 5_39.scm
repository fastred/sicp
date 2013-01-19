(define frame-num car)
(define displacement-num cdr)

(define (lexical-address-lookup addr env)
  (let* ((frame (list-ref env (frame-num addr)))
         (value (list-ref (frame-values frame) (displacement-num addr))))
    (if (eq? value '*unassigned*)
      (error "Variable is unassigned -- lexical-address-lookup" addr)
      value)))

(define (lexical-address-set! addr env new-value)
  (let* ((frame (list-ref env (frame-num addr))))
    (define (set-value! frame-values displacement-num)
      (if (= displacement-num 0)
        (set-car! frame-values new-value)
        (set-value! (cdr frame-values) (- displacement-num 1))))
    (set-value! (frame-values frame) (displacement-num addr))
    'ok))

