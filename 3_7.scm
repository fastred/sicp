(define (make-account balance acc-password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch password m)
    (if (eq? password acc-password)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m)))
    (error "Wrong password")))
  dispatch)

(define (make-joint acc acc-password new-password)
  (lambda (password m)
    (if (eq? password new-password)
      (acc acc-password m)
      (error "Wrong password"))))

; test
(define peter-acc (make-account 100 'secret-password))
(define paul-acc
  (make-joint peter-acc 'secret-password 'rosebud))
((peter-acc 'secret-password 'withdraw) 50)
((paul-acc 'rosebud 'withdraw) 10)
((peter-acc 'secret-password 'withdraw) 10)

