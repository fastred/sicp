(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
              (cons proc (map stream-cdr argstreams))))))

(define s (cons-stream 1 (cons-stream 2 '())))
(define a (stream-map + s s))
(stream-ref a 0)
(stream-ref a 1)
