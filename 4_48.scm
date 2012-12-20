; I've decided to add simple parsers for adjectives with nouns and
; adverbs with verbs.

(define adverbs '(adverb calmly carefully thoroughly))

(define adjectives '(adjective pretty smart young large old))

(define (parse-adverb)
  (parse-word adverbs))

(define (parse-verb-phrase)
  (define (maybe-extend verb-phrase)
    (amb verb-phrase
         (maybe-extend (list 'verb-phrase verb-phrase (parse-adverb)))
         (maybe-extend (list 'verb-phrase
                             verb-phrase
                             (parse-adverb)
                             (parse-prepositional-phrase)))
         (maybe-extend (list 'verb-phrase
                             verb-phrase
                             (parse-prepositional-phrase)))))
  (maybe-extend (parse-word verbs)))

(define (parse-adjectives)
  (amb (list 'adjectives (parse-word adjectives) (parse-adjectives))
       (parse-word adjectives)))

(define (parse-simple-noun-phrase)
  (amb (list 'simple-noun-phrase
             (parse-word articles)
             (parse-adjectives)
             (parse-word nouns))
       (list 'simple-noun-phrase
             (parse-word articles)
             (parse-word nouns))))

(define (parse-noun-phrase)
  (define (maybe-extend noun-phrase)
    (amb noun-phrase
         (maybe-extend (list 'noun-phrase
                             noun-phrase
                             (parse-prepositional-phrase)))))
  (maybe-extend (parse-simple-noun-phrase)))

; Examples:

; "the old professor lectures thoroughly"
;(sentence
  ;(simple-noun-phrase (article the) (adjective old) (noun professor))
  ;(verb-phrase (verb lectures) (adverb thoroughly)))


; "the pretty smart cat sleeps in the large class"
;(sentence
  ;(simple-noun-phrase
    ;(article the) (adjectives (adjective pretty) (adjective smart))
    ;(noun cat))
  ;(verb-phrase (verb sleeps) (prep-phrase (prep in) (simple-noun-phrase (article the) (adjective large) (noun class)))))
