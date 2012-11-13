(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define a (cons 'a (cons 'b (cons 'c '()))))
(count-pairs a)
; 3
(set-car! a (cddr a))
(count-pairs a)
; 4
(set-car! a (cdr a))
(set-car! (cdr a) (cddr a))
(count-pairs a)
; 7
(define b (list 'a 'b 'c))
(set-cdr! (cddr b) b)
;(count-pairs b)
; doesn't return
