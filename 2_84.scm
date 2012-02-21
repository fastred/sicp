(define (level-number levels name)
  (define levels '(integer rational real complex))
  (if (eq? (car levels) name)
    0
    (+ 1 (level-number (cdr levels) name))))

(define (raise-to level x)
  (if (= level (level-number x))
      x
      (raise-to level (raise x))))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
        (apply proc (map contents args))
        (if (= (length args) 2)
          (let* ((type1 (car type-tags))
                (type2 (cadr type-tags))
                (level1 (level-number type1))
                (level2 (level-number type2))
                (a1 (car args))
                (a2 (cadr args)))
            (cond ((<= level1 level2) (apply-generic op (raise-to level2 a1) a2))
                  (else level1 level2) (apply-generic op a1 (raise-to level1 a2)))
          (error "Method not found for provided types"
                             (list op type-tags)))))))
; NOT TESTED
