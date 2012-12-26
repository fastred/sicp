(load "ch4-4-setup.scm")

(define unique-query car)
(define (uniquely-asserted operands frame-stream)
  (stream-flatmap
    (lambda (frame)
      (let ((results (qeval (unique-query operands)
                            (singleton-stream frame))))
        (if (and (not (stream-null? results)) (stream-null? (stream-cdr results)))
          results
          the-empty-stream)))
    frame-stream))

(put 'unique 'qeval uniquely-asserted)

(run '(and (address ?s ?addr) (unique (supervisor ?p ?s))))
;(and (address (scrooge eben) (weston (shady lane) 10)) (unique (supervisor (cratchet robert) (scrooge eben))))
;(and (address (hacker alyssa p) (cambridge (mass ave) 78)) (unique (supervisor (reasoner louis) (hacker alyssa p))))
