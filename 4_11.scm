(load "ch4-mceval.scm")

; Some of the definitions could be shortened with a 'map', but it isn't defined
; in our interpreter.

(define (make-frame variables values)
  (if (null? variables)
    '()
    (cons (cons (car variables) (car values))
                (make-frame (cdr variables) (cdr values)))))

(define (frame-variables frame)
  (if (null? frame)
    '()
    (cons (caar frame) (frame-variables (cdr frame)))))

(define (frame-values frame)
  (if (null? frame)
    '()
    (cons (cdar frame) (frame-values (cdr frame)))))

(define (add-binding-to-frame! var val frame)
  (let ((first-pair (car frame)))
    (set-car! frame (cons var val))
    (set-cdr! frame (cons first-pair (cdr frame)))))

