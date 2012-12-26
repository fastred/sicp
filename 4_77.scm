(load "ch4-4-setup.scm")

; I've decided to use approach similar to that from the exercise 4.16.
; I'm changing order of conjuncts in 'and' form. 'not' and 'lisp-value'
; queries will be the last ones.
; Book asks for more advanced solution, but at the moment I can't find examples
; that would require it.

(define (conjoin conjuncts frame-stream)
  (let ((sorted (change-order-of-conjuncts conjuncts)))
    (define (conjoin-rec conjuncts frame-stream)
      (if (empty-conjunction? conjuncts)
        frame-stream
        (conjoin-rec (rest-conjuncts conjuncts)
                 (qeval (first-conjunct conjuncts)
                        frame-stream))))
    (conjoin-rec sorted frame-stream)))

(define (filtering-query? exp)
  (or (eq? (type exp) 'not) (eq? (type exp) 'lisp-value)))

(define (change-order-of-conjuncts conjuncts)
  (let ((filter-queries (filter filtering-query? conjuncts))
        (other-queries (filter (lambda (a) (not (filtering-query? a))) conjuncts)))
    (append other-queries filter-queries)))

(put 'and 'qeval conjoin)

; With this change
(run '(and (supervisor ?x ?y)
     (not (job ?x (computer programmer)))))
; and
(run '(and (not (job ?x (computer programmer)))
     (supervisor ?x ?y)))
; return the same results.
