(load "ch4-4-setup.scm")

; We see duplicates because lives-near is a symmetric relation.
; We can remove duplicates with additional condition, e.g. we can force
; person-1's name to be lexicographically before person-2's name. It'll work
; fine unless there are duplicated names.

(define words-list-compare
  (lambda (a b)
    (define (list->string words)
      (reduce-left string-append "" (map symbol->string words)))
    (let ((first (list->string a))
          (second (list->string b)))
      (string<? first second))))

(run '(and (lives-near ?person-1 ?person-2)
           (lisp-value words-list-compare ?person-1 ?person-2)))
