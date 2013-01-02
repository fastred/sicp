Lines that can be removed are commented out in a code below:

 afterfib-n-1
   (restore n)
   ;(restore continue)
   (assign n (op -) (reg n) (const 2))
   ;(save continue)
   (assign continue (label afterfib-n-2))
   (save val)
   (goto (label fib-loop))

