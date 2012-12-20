; I'm not sure if these descriptions are 100% correct.
;
; Professor is with the cat, he is in the class and he lectures student.
(sentence
  (simple-noun-phrase (article the) (noun professor))
  (verb-phrase
    (verb-phrase
      (verb-phrase (verb lectures)
                   (prep-phrase (prep to) (simple-noun-phrase
                                            (article the) (noun student))))
      (prep-phrase (prep in) (simple-noun-phrase (article the) (noun class))))
    (prep-phrase (prep with) (simple-noun-phrase (article the) (noun cat)))))

; Professor lectures student. Professor is in the class in which there's a cat.
(sentence
  (simple-noun-phrase (article the) (noun professor))
  (verb-phrase
    (verb-phrase
      (verb lectures) (prep-phrase (prep to) (simple-noun-phrase (article the) (noun student))))
    (prep-phrase (prep in) (noun-phrase (simple-noun-phrase (article the) (noun class))
                                        (prep-phrase (prep with) (simple-noun-phrase (article the)
                                                                                     (noun cat)))))))

;Professor lectures student, who is in the class. Professor is with the cat.
(sentence
  (simple-noun-phrase (article the)
                      (noun professor))
  (verb-phrase
    (verb-phrase
      (verb lectures)
      (prep-phrase (prep to)
                   (noun-phrase
                     (simple-noun-phrase (article the) (noun student))
                     (prep-phrase (prep in) (simple-noun-phrase (article the) (noun class))))))
    (prep-phrase (prep with) (simple-noun-phrase (article the) (noun cat)))))

; Professor lectures the student. Student is with the cat and they're in the class. 
(sentence
  (simple-noun-phrase
    (article the) (noun professor))
  (verb-phrase (verb lectures)
               (prep-phrase (prep to)
                            (noun-phrase
                              (noun-phrase (simple-noun-phrase (article the) (noun student))
                                           (prep-phrase (prep in) (simple-noun-phrase (article the) (noun class))))
                              (prep-phrase (prep with)
                                           (simple-noun-phrase (article the) (noun cat)))))))

; Professor lectures to the student, who is in the class in which there's a cat.
(sentence
  (simple-noun-phrase
    (article the) (noun professor))
  (verb-phrase (verb lectures)
               (prep-phrase (prep to)
                            (noun-phrase
                              (simple-noun-phrase (article the) (noun student))
                              (prep-phrase (prep in)
                                           (noun-phrase (simple-noun-phrase (article the) (noun class))
                                                        (prep-phrase (prep with)
                                                                     (simple-noun-phrase (article the) (noun cat)))))))))

