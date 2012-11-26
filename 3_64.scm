(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
             (stream-for-each proc (stream-cdr s)))))
(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))
(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (average a b )
  (/ (+ a b) 2))
(define (sqrt-improve guess x)
  (average guess (/ x guess)))
(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0
                 (stream-map (lambda (guess)
                               (sqrt-improve guess x))
                             guesses)))
  guesses)

(define (stream-limit stream tolerance)
  (define (limit-rec stream previous)
    (let ((current (stream-car stream)))
          (if (< (abs (- current previous)) tolerance)
            current
            (limit-rec (stream-cdr stream) current))))
  (limit-rec stream 0))
(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

;(sqrt 2 0.0001)
