(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))

(define (permutations s)
  (if (null? s)                    ; empty set?
      (list '())                   ; sequence containing empty set
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))
(define (distinct? items)
  (cond ((null? items) true)
        ((null? (cdr items)) true)
        ((member (car items) (cdr items)) false)
        (else (distinct? (cdr items)))))

(define (reqs try)
  (let ((baker (car try))
         (cooper (cadr try))
         (fletcher (caddr try))
         (miller (cadddr try))
         (smith (cadddr (cdr try))))
    (and (> miller cooper) (not (= fletcher 5)) (not (= fletcher 1)) (not (= baker 5))
         (not (= cooper 1)) (not (= (abs (- fletcher cooper)) 1)) 
         (not (= (abs (- smith fletcher)) 1))
         (distinct? (list baker cooper fletcher miller smith)))))

(define solutions (filter reqs (permutations '(1 2 3 4 5))))
(map (lambda (solution) 
            (map list (list 'baker 'cooper 'fletcher 'miller 'smith) solution))
     solutions)
; Result:
; (((baker 3) (cooper 2) (fletcher 4) (miller 5) (smith 1)))
