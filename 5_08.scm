(load "ch5-regsim.scm")

; In current implementation register 'a' would contain value 3.

(define (label-exists? labels label)
  (memq label (map car labels)))
(define (extract-labels text receive)
  (if (null? text)
    (receive '() '())
    (extract-labels (cdr text)
                    (lambda (insts labels)
                      (let ((next-inst (car text)))
                        (if (symbol? next-inst)
                          (if (not (label-exists? labels next-inst))
                            (receive insts
                                     (cons (make-label-entry next-inst
                                                             insts)
                                           labels))
                            (error "Label already exists -- EXTRACT-LABELS" next-inst))
                          (receive (cons (make-instruction next-inst)
                                         insts)
                                   labels)))))))

(define machine
  (make-machine
   '(a)
   (list (list '= =) (list '* *) (list '+ +) (list '- -))
   '(
    start
      (goto (label here))
    here
      (assign a (const 3))
      (goto (label there))
    here
      (assign a (const 4))
      (goto (label there))
    there)))

(start machine)
(get-register-contents machine 'a)
