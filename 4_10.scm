(load "4_4.scm")

; changes are really easy with data-directed eval
(puteval '&& eval-and)
(puteval '|| eval-or)
