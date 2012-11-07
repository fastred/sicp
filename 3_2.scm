(define (make-monitored f)
  (let ((times-called 0))
    (lambda (x)
      (if (eq? x 'how-many-calls?)
        times-called
        (begin (set! times-called (+ times-called 1))
               (f x))))))

(define s (make-monitored sqrt))

(s 100)
(s 10)
(s 'how-many-calls?)
