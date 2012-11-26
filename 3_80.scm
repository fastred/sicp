(load "3_73.scm")

(define (integral delayed-integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (let ((integrand (force delayed-integrand)))
                   (add-streams (scale-stream integrand dt)
                                int))))
  int)

(define (RLC R L C dt)
  (lambda (v_c_0 i_l_0)
    (define i_l (integral (delay di_l) i_l_0 dt))
    (define v_c (integral (delay dv_c) v_c_0 dt))
    (define di_l (stream-map + (scale-stream i_l (/ (- R) L))
                             (scale-stream v_c (/ 1 L))))
    (define dv_c (scale-stream i_l (/ (- 1) C)))
    (cons v_c i_l)))

(define RLC1 (RLC 1 1 0.2 0.1))
(define result (RLC1 10 0))

