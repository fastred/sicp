(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
    set
    (cons x set)))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? (cdr set1)) (adjoin-set (car set1) set2))
        (else (union-set (cdr set1) (adjoin-set (car set1) set2)))))

(union-set (list 1 2 3 5 6) (list 3 4 5 6))
(union-set '() (list 1 2 3))
