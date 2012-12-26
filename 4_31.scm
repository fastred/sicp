(load "ch4-leval.scm")

; for (define (x a (b lazy) c)
; returns (a b c)
(define (procedure-parameters p)
  (map (lambda (x)
         (if (pair? x)
           (car x)
           x))
       (cadr p)))

; for (define (x a (b lazy) c)
; returns (a (b lazy) c)
(define (procedure-parameters-raw p) (cadr p))

(define (apply procedure arguments env)
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure
           procedure
           (list-of-arg-values arguments env))) ; changed
        ((compound-procedure? procedure)
         (let ((parameters (procedure-parameters-raw procedure)))
           (eval-sequence
             (procedure-body procedure)
             (extend-environment
               (procedure-parameters procedure)
               ; we now also pass formal parameters of procedure
               (list-of-maybe-delayed-args arguments parameters env)
               (procedure-environment procedure)))))
        (else
          (error
            "Unknown procedure type -- APPLY" procedure))))

(define (delay-it-wo-memo exp env)
  (list 'thunk-wo-memo exp env))
(define (thunk-wo-memo? obj)
  (tagged-list? obj 'thunk-wo-memo))
(define (lazy-wo-memo? exp)
  (and (pair? exp) (eq? (cadr exp) 'lazy)))
(define (lazy-memo? exp)
  (and (pair? exp) (eq? (cadr exp) 'lazy-memo)))
(define (force-it obj)
  (cond ((thunk-wo-memo? obj)
         (actual-value (thunk-exp obj) (thunk-env obj)))
        ((thunk? obj)
         (let ((result (actual-value
                         (thunk-exp obj)
                         (thunk-env obj))))
           (set-car! obj 'evaluated-thunk)
           (set-car! (cdr obj) result)  ; replace exp with its value
           (set-cdr! (cdr obj) '())     ; forget unneeded env
           result))
        ((evaluated-thunk? obj)
         (thunk-value obj))
        (else obj)))

(define first-parameter car)
(define rest-parameters cdr)
(define (parameter-proc exp)
  (cond ((lazy-memo? exp) delay-it)
        ((lazy-wo-memo? exp) delay-it-wo-memo)
        (else actual-value)))

(define (list-of-maybe-delayed-args exps params env)
  (if (no-operands? exps)
    '()
    (let* ((parameter (first-parameter params))
           (pproc (parameter-proc parameter)))
      (cons (pproc (first-operand exps) env)
            (list-of-maybe-delayed-args (rest-operands exps)
                                        (rest-parameters params)
                                        env)))))

; test
(define the-global-environment (setup-environment))
(define (run input)
  (let ((output
          (actual-value input the-global-environment)))
    (announce-output output-prompt)
    (user-print output)))

(run '(define count 0))
(run '(define (square (x lazy)) (* x x)))
(run '(define (id (x lazy))
        (set! count (+ count 1))
        x))
(run '(square (id 10)))
(run 'count)
; 2

(run '(define count 0))
(run '(define (square (x lazy-memo)) (* x x)))
(run '(define (id (x lazy-memo))
        (set! count (+ count 1))
        x))
(run '(square (id 10)))
(run 'count)
; 1
