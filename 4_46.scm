; If operands were evaluated in different order, then for example:
(define (parse-sentence)
  (list 'sentence
         (parse-noun-phrase)
         (parse-verb-phrase)))
; could first try to parse verb-phrase. It would break parsing of correct sentences.
