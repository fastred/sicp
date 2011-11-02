(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append (list 1 2 3) (list 3 4 5))

(define (length sequence)
  (accumulate (lambda (first already-acc) (+ 1 already-acc)) 0 sequence))

(length (list 1 2 3 4 5 5))
