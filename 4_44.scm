(define (require p)
  (if (not p) (amb)))

(define (distinct? items)
  (cond ((null? items) true)
        ((null? (cdr items)) true)
        ((member (car items) (cdr items)) false)
        (else (distinct? (cdr items)))))

(define (an-integer-between low high)
  (if (not (>= low high))
    (amb low (an-integer-between (+ low 1) high))
    low))

; Definition of 'safe?' is included in ch4-ambeval.scm because ambeval doesn't support
; 'or' and 'and'. I've tried implementing them but they caused some weird bugs, so
; I removed them for now.

(define (queens board-size)
  (define (queen-cols k acc)
    (if (not (> k board-size))
      (let ((choice (an-integer-between 1 board-size)))
        (let ((new-board (append acc (list choice))))
          (require (distinct? new-board))
          (require (safe? k new-board))
          (queen-cols (+ k 1) new-board)))
      acc))
  (queen-cols 1 '()))

; First -- not too good -- attempt:
;(define (queens-ugly)
  ;(let ((q1 (an-integer-between 1 8)))
    ;(let ((q2 (an-integer-between 1 8)))
      ;(require (distinct? (list q1 q2)))
      ;(require (safe? 2 (list q1 q2)))
      ;(let ((q3 (an-integer-between 1 8)))
        ;(require (distinct? (list q1 q2 q3)))
        ;(require (safe? 3 (list q1 q2 q3)))
        ;(let ((q4 (an-integer-between 1 8)))
          ;(require (distinct? (list q1 q2 q3 q4)))
          ;(require (safe? 4 (list q1 q2 q3 q4)))
          ;(let ((q5 (an-integer-between 1 8)))
            ;(require (distinct? (list q1 q2 q3 q4 q5)))
            ;(require (safe? 5 (list q1 q2 q3 q4 q5)))
            ;(let ((q6 (an-integer-between 1 8)))
              ;(require (distinct? (list q1 q2 q3 q4 q5 q6)))
              ;(require (safe? 6 (list q1 q2 q3 q4 q5 q6)))
              ;(let ((q7 (an-integer-between 1 8)))
                ;(require (distinct? (list q1 q2 q3 q4 q5 q6 q7)))
                ;(require (safe? 7 (list q1 q2 q3 q4 q5 q6 q7)))
                ;(let ((q8 (an-integer-between 1 8)))
                  ;(require (distinct? (list q1 q2 q3 q4 q5 q6 q7 q8)))
                  ;(require (safe? 8 (list q1 q2 q3 q4 q5 q6 q7 q8)))
                  ;(list q1 q2 q3 q4 q5 q6 q7 q8))))))))))
