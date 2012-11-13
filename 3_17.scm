(define (append x y)
  (if (null? x)
      y
      (cons (car x) (append (cdr x) y))))

(define (append! x y)
    (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (count-pairs x)
  (define (count-pairs-rec x acc)
    (cond ((not (pair? x)) 0)
          ; don't go further if the pair was already seen
          ((memq x acc) 0)
          (else (begin (append! acc (list x))
                       (+ (count-pairs-rec (car x) acc)
                          (count-pairs-rec (cdr x) acc)
                          1)))))
  (count-pairs-rec x (list '())))

(define a (list 'a 'b 'c))
(count-pairs a)
(set-car! a (cddr a))
(count-pairs a)
(set-car! a (cdr a))
(set-car! (cdr a) (cddr a))
(count-pairs a)
