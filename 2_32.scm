(define (subsets s)
  (if (null? s)
    (list '())
    (let ((rest (subsets (cdr s))))
      (append rest (map
                     (lambda (x) (cons (car s) x))
                     rest)))))

(subsets (list 1 2 3))

;I did this one with pen & paper. My way of reasoning:
;'rest' is a list of subsets created from the cdr of the list 's'.
;Those subsets either include or don't include car of 's'.
;That's why we 'append':
; - 'rest',
; - list of consed cars with every element of 'rest'.

;It's easy to picture it if we trace recursion backwards:
;(rest '())      => '(())
;(rest '(3))     => '(() (3))
;(rest '(2 3))   => '(() (3) (2) (2 3))
;(rest '(1 2 3)) => '(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

;Note: '=>' means "returns"
