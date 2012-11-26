(define zero-crossings
  (stream-map sign-change-detector sense-data (cons 0 sense-data)))
