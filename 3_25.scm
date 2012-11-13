(define (make-table)
  (list '*table*))

(define (assoc key records)
  (cond ((null? records) false)
        ((equal? key (caar records)) (car records))
        (else (assoc key (cdr records)))))

(define (lookup keys table)
  (let ((record (assoc (car keys) (cdr table))))
      (if record
        (if (not (null? (cdr keys)))
          (lookup (cdr keys) record)
          (cdr record))
        false)))

(define (insert! keys value table)
  (let ((record (assoc (car keys) (cdr table))))
    (if (not (null? (cdr keys)))
      (if record
        (insert! (cdr keys) value record)
        (begin (set-cdr! table
                  (cons (list (car keys))
                        (cdr table)))
               ; assoc looks for the just inserted key
               (insert! (cdr keys) value (assoc (car keys) (cdr table)))))
      (if record
          (set-cdr! record value)
          (set-cdr! table
                    (cons (cons (car keys) value) (cdr table))))))
  'ok)

(define table (make-table))
(define key1 (list 'a 'b))
(define key2 (list 'a 'c 'd))
(insert! key1 1 table)
(insert! key2 2 table)
(lookup key1 table)
(lookup key2 table)
