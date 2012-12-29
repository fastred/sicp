(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items '()))

(square-list (list 1 2 3 4))
; Answer list is reversed because newest element is a first argument to cons,
; so the list is build this way:
; (1)
; (4 1)
; (9 4 1)
; (16 9 4 1)

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

(square-list (list 1 2 3 4))
;This procedure also doesn't work because answer is build as showed below:
;(() 1)
;((() 1) 4)
;(((() 1) 4) 9)
;((((() 1) 4) 9) 16)


