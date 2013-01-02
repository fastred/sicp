; a)
(controller
  sqrt-loop
    (assign x (op read))
    (assign g (const 1))
  test-b
    (test (op good-enough?) (reg g))
    (branch (label sqrt-done))
    (assign g (op improve) (reg g))
    (goto (label test-b))
  sqrt-done
    (perform (op print) (reg g))
    (goto (label sqrt-loop)))

; b) It can be done with one temporary register, but it would be hard to draw.
(controller
  sqrt-loop
    (assign x (op read))
    (assign g (const 1))
  test-b
    (assign t1 (op square) (reg g))
    (assign t1 (op -) (reg t1) (reg x))
    (assign t1 (op abs) (reg t1))
    (test (op <) (reg t1) (const 0.001))
    (branch (label sqrt-done))
    (assign t2 (op /) (reg x) (reg g))
    (assign g (op average) (reg g) (reg t2))
    (goto (label test-b))
  sqrt-done
    (perform (op print) (reg g))
    (goto (label sqrt-loop)))

