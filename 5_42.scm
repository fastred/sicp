(load "5_40.scm")
(define (compile-variable exp target linkage comp-time-env)
  (end-with-linkage linkage
    (make-instruction-sequence '(env) (list target)
      (let ((addr (find-variable exp comp-time-env)))
        (if (eq? addr 'not-found)
          `((assign ,target
                    (op lookup-variable-value)
                    (const ,exp)
                    (reg env)))
          `((assign ,target
                    (op lexical-address-lookup)
                    (const ,addr)
                    (reg env))))))))


(define (compile-assignment exp target linkage comp-time-env)
  (let ((var (assignment-variable exp))
        (get-value-code
         (compile (assignment-value exp) 'val 'next comp-time-env)))
    (end-with-linkage linkage
     (preserving '(env)
      get-value-code
      (make-instruction-sequence '(env val) (list target)
        (let ((addr (find-variable var comp-time-env)))
          (if (eq? addr 'not-found)
            `((perform (op set-variable-value!)
                      (const ,var)
                      (reg val)
                      (reg env))
              (assign ,target (const ok)))
            `((perform (op lexical-address-set!)
                      (const ,addr)
                      (reg env)
                      (reg val))
              (assign ,target (const ok)))
            )))))))

;(define code '(((lambda (x y)
   ;(lambda (a b c d e)
     ;((lambda (y z) (* x y z))
      ;(* a b x)
      ;(+ c d x))))
 ;3 4) 5 6 7 8 9))
;(show-formatted (compile code
                         ;'val
                         ;'next
                         ;empty-comp-time-env))
;(compile-and-go code)

