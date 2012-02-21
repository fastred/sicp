(define (attach-tag type-tag contents)
  (if (number? contents)
    contents
    (cons type-tag contents)))

(define (type-tag datum)
  (cons ((number? datum) 'scheme-number)
        ((pair? datum) (car datum))
        (else (error "Bad tag name -- TYPE-TAG" datum))))

(define (contents datum)
  (cons ((number? datum) datum)
        ((pair? datum) (cdr datum))
        (else (error "Bad contents -- TYPE-TAG" datum))))

