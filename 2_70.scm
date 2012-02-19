(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))
(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))
(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))
(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))
(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))
(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                    (make-leaf 'B 2)
                    (make-code-tree (make-leaf 'D 1)
                                    (make-leaf 'C 1)))))

(define (encode-symbol symbol tree)
  (define (contains-symbol? symbol symbols)
    (cond ((null? symbols) false)
          ((eq? symbol (car symbols)) true)
          (else (contains-symbol? symbol (cdr symbols)))))

  (define (encode-symbol-1 symbol tree)
    (let ((left (left-branch tree))
          (right (right-branch tree)))
      (cond ((leaf? tree) '())
            ((contains-symbol? symbol (symbols left)) (list '0))
            ((contains-symbol? symbol (symbols right)) (cons 1 (encode-symbol symbol right))))))

  (if (contains-symbol? symbol (symbols tree))
    (encode-symbol-1 symbol tree)
    (error "Message contains letters not found in the tree.")))

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree))))


(define (successive-merge set)
  (if (= 1 (length set))
      (car set)
      (successive-merge
       (adjoin-set (make-code-tree (car set) (cadr set)) (cddr set)))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define pairs '((A 2) (BOOM 1) (GET 2) (JOB 2) (NA 16)
                (SHA 3) (YIP 9) (WAH 1)))
(define song '(GET A JOB
               SHA NA NA NA NA NA NA NA NA
               GET A JOB
               SHA NA NA NA NA NA NA NA NA
               WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
               SHA BOOM))

(length (encode song (generate-huffman-tree pairs)))
; CR=79/89
