; Before requiring that floors must be distinct there is 5^5 assignments.
; After applying this requirement we're left with only 5! available assignments.
;

(define (multiple-dwelling-fast)
  (let ((fletcher (amb 1 2 3 4 5)))
    (require (not (= fletcher 5)))
    (require (not (= fletcher 1)))
    (let ((baker (amb 1 2 3 4 5)))
      (require (not (= baker 5)))
      (let ((cooper (amb 1 2 3 4 5)))
        (require (not (= cooper 1)))
        (require (not (= (abs (- fletcher cooper)) 1)))
        (let ((miller (amb 1 2 3 4 5)))
          (require (> miller cooper))
          (let ((smith (amb 1 2 3 4 5)))
            (require (not (= (abs (- smith fletcher)) 1)))
            (require
              (distinct? (list baker cooper fletcher miller smith)))
            (list (list 'baker baker)
                  (list 'cooper cooper)
                  (list 'fletcher fletcher)
                  (list 'miller miller)
                  (list 'smith smith))))))))

; This solution could be further improved by removing incorrect floors from
; (amb ...) altogether.
