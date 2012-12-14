; Code that was used for testing:

;(define (fib n)
  ;(cond ((= n 0)
         ;0)
        ;((= n 1)
         ;1)
        ;(else (+ (fib (- n 1)) (fib (- n 2))))))
;(fib 22)


;Results from the version without analysis phase:
;14,87s user 0,18s system 99% cpu 15,070 total
;15,98s user 0,22s system 99% cpu 16,311 total
;15,40s user 0,19s system 99% cpu 15,668 total
;
;Results from the version with analysis phase:
;9,19s user 0,17s system 99% cpu 9,415 total
;8,79s user 0,16s system 99% cpu 8,968 total
;8,84s user 0,16s system 99% cpu 9,037 total
;
;So on this simplistic fibonacci procedure on average 43% percent of time was
;spent during analysis of expressions.

