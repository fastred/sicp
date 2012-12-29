(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (sum-of-triple a)
  (+ (car a) (cadr a) (caddr a)))
(define (triples-that-sum n k)
  (filter (lambda (a) (= (sum-of-triple a) k))
          (flatmap (lambda (i)
                     (flatmap (lambda (j)
                                (map (lambda (k) (list i j k))
                                     (enumerate-interval 1 (- j 1))))
                              (enumerate-interval 1 (- i 1))))
                   (enumerate-interval 1 n))))

