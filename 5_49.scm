(load "5_43.scm")

(define (compile-and-assemble expression machine)
  (let ((instructions
          (assemble (statements
                      (compile expression 'val 'return empty-comp-time-env))
                    machine)))
    instructions))

(define operations
  (cons (list 'compile-and-assemble compile-and-assemble) eceval-operations))

(define repl-with-compile
  (make-machine
   '(exp env val proc argl continue unev compapp machine-ptr)
   operations
   '(
read-compile-execute-print-loop
  (perform (op initialize-stack))
  (perform
    (op prompt-for-input) (const ";;; REPL-Compile input:"))
  (assign exp (op read))
  (assign env (op get-global-environment))
  (assign exp (op compile-and-assemble) (reg exp) (reg machine-ptr))
  (assign continue (label print-results))
  (goto (reg exp))
print-results
  (perform (op print-stack-statistics))
  (perform
   (op announce-output) (const ";;; REPL-Compile value:"))
  (perform (op user-print) (reg val))
  (goto (label read-compile-execute-print-loop))
  )))
     
(define (run)
  (set-register-contents! repl-with-compile 'machine-ptr repl-with-compile)
  (set! the-global-environment (setup-environment))
  (set-register-contents! repl-with-compile 'flag false)
  (start repl-with-compile))

(run)

; Sample output:

;;; EC-Compiled input:
(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1)) (fib (- n 2)))))

(total-pushes = 0 maximum-depth = 0)
;;; EC-Compiled value:
ok

;;; EC-Compiled input:
(fib 6)

(total-pushes = 122 maximum-depth = 17)
;;; EC-Compiled value:
8
