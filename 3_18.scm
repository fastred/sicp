(define (append! x y)
    (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define has-cycle
  (let ((acc (list '())))
    (lambda (x)
      (cond ((eq? (cdr x) '()) #f)
            ((memq x acc) #t)
            (else (begin (append! acc (list x))
                         (has-cycle (cdr x))))))))
(define has-cycle
  (let ((acc (list '())))
    (lambda (x)
      ; Resets acc before returning. Alternatively it could be done in the same
      ; way as in the previous assignment.
      (cond ((eq? (cdr x) '()) (begin (set! acc (list '())) #f))
            ((memq x acc) (begin (set! acc (list '())) #t))
            (else (begin (append! acc (list x))
                         (has-cycle (cdr x))))))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))
(define a (list 'a 'b 'c))
(has-cycle a)
; #f
(has-cycle z)
; #t
