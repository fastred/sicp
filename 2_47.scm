(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))
(define frame-origin car)
(define frame-edge1 cadr)
(define frame-edge2 caddr)

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define frame-origin car)
(define frame-edge1 cadr)
(define frame-edge2 cddr)

