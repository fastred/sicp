(load "ch3support.scm")
(define random-init 7)
(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))

; random-numbers as an argument takes a stream in the form:
; ('generate 'generate ('reset 4) 'generate)
; where 4 is the new seed
(define (random-numbers stream)
  (define (rec stream last-num)
    (if (stream-null? stream)
      the-empty-stream
      (let ((scar (stream-car stream)))
        (if (eq? scar 'generate)
          (cons-stream (rand-update last-num)
                       (rec (stream-cdr stream) (rand-update last-num)))
          ; todo reset
          (cons-stream (rand-update (cdr scar))
                       (rec (stream-cdr stream) (rand-update (cdr scar))))))))
  (rec stream random-init))
(define gen3times (cons-stream 'generate (cons-stream 
                                           'generate (cons-stream 'generate the-empty-stream))))
(define a (random-numbers gen3times))
(define b (random-numbers (cons-stream 'generate (cons-stream 'generate (cons-stream (cons 'reset 7)
                                                                                     gen3times)))))
;(display-stream a)
;(display-stream b)

