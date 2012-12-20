; I've added randomness to the selection of the word from the list.
; Thanks to that results became way more interesting.

(define (random-element list)
  (list-ref list (random (length list))))

(define (parse-word word-list)
  (list (car word-list) (random-element (cdr word-list))))

; Sample results:
; a cat eats
; a cat eats in the student
; a cat eats in the student in a professor
; a cat eats in the student in a professor for the cat
; a cat eats in the student in a professor for the cat for the student

