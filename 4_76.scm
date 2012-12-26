(load "ch4-4-setup.scm")

(define (conjoin conjuncts frame-stream)
  (if (empty-conjunction? conjuncts)
    frame-stream
    (optand-merge (qeval (first-conjunct conjuncts) frame-stream)
                  (conjoin (rest-conjuncts conjuncts) frame-stream))))

(define bind-variable caar)
(define bind-value cdar)

; this procedure is thanks to:
; http://eli.thegreenplace.net/2008/02/09/sicp-sections-442-444/
(define (unify-patterns p1 p2)
  (if (stream-null? p1)
    p2
    (let ((extended (extend-if-possible (bind-variable p1) (bind-value p1) p2)))
      (if (eq? extended 'failed)
        'failed
        (unify-patterns (cdr p1) extended)))))

(define (optand-merge stream1 stream2)
  (if (stream-null? stream1)
    the-empty-stream
    (let ((results (stream-flatmap
                     (lambda (p1)
                       (stream-map (lambda (p2) (unify-patterns p1 p2))
                                   stream2))
                     stream1)))
      (stream-filter (lambda (x) (not (eq? x 'failed))) results)
      )))

(put 'and 'qeval conjoin)

