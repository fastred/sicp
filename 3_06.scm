(load "ch3support.scm")

(define random-init 7)
(define rand
  (let ((x random-init))
    (lambda (action)
      (cond ((eq? action 'generate)
             (begin (set! x (rand-update x))
                    x))
            ((eq? action 'reset)
             (lambda (newx)
               (set! x newx)))))))

; test
(rand 'generate)
(rand 'generate)
(rand 'generate)
((rand 'reset) 7)
(rand 'generate)
(rand 'generate)
