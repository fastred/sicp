(define (for-each-new proc items)
  (cond ((not (null? items)) 
    (proc (car items))
    (for-each-new proc (cdr items)))))

(for-each-new (lambda (x) (newline) (display x))
          (list 57 321 88))