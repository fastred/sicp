(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (cond ((pair? structure) (total-weight structure))
          (else structure))))

(define (total-weight mobile)
  (cond ((not (pair? mobile)) 0)
        (else (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))))

(define x (make-mobile (make-branch 1 8) (make-branch 3 4)))

(total-weight (make-mobile (make-branch 1 3.3) (make-branch 5 (make-mobile (make-branch 1 2) (make-branch 1 x)))))

; TODO: Part c)
