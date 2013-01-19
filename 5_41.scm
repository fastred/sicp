; returns element position in the list
; if element is not found returns -1
(define (find-element-pos list el)
  (define (find-acc list pos)
    (if (null? list)
      -1
      (if (eq? (car list) el)
        pos
        (find-acc (cdr list) (+ pos 1)))))
  (find-acc list 0))

(define (find-variable var-name env)
  (define (find-rec env frame-num)
    (if (null? env)
      'not-found
      (let ((disp-num (find-element-pos (car env) var-name)))
        (if (= disp-num -1)
          (find-rec (cdr env) (+ frame-num 1))
          (cons frame-num disp-num)))))
  (find-rec env 0))
