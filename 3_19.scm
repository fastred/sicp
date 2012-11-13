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
(define (has-cycle-floyd x)
  (define (has-cycle-floyd-rec first second)
    (cond ((or (null? (cdr first)) (null? (cddr first))
               (null? (cdr second))) #f)
          ((eq? first second) #t)
          (else has-cycle-floyd-rec (cddr first) (cdr second))))
  (if (and (not (null? x)) (not (null? (cdr x))) (not (null? (cddr x))))
    (has-cycle-floyd-rec (cddr x) (cdr x))
    #f))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))
(define a (list 'a 'b 'c))
(has-cycle-floyd a)
(has-cycle z)
