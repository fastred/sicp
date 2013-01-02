; Factorial
(controller
   (assign continue (label fact-done))     ; set up final return address
 fact-loop
   (test (op =) (reg n) (const 1))
   (branch (label base-case))
   ;; Set up for the recursive call by saving n and continue.
   ;; Set up continue so that the computation will continue
   ;; at after-fact when the subroutine returns.
   (save continue)
   (save n)
   (assign n (op -) (reg n) (const 1))
   (assign continue (label after-fact))
   (goto (label fact-loop))
 after-fact
   (restore n)
   (restore continue)
   (assign val (op *) (reg n) (reg val))   ; val now contains n(n - 1)!
   (goto (reg continue))                   ; return to caller
 base-case
   (assign val (const 1))                  ; base case: 1! = 1
   (goto (reg continue))                   ; return to caller
 fact-done)

Execution of (fact 2).

In fact-loop before goto (line 14):
registers:
  continue = after-fact
  n = 1
stack:
  2
  fact-done

In second loop through fact-loop n equals 1, so we branch to base-case, state
before branching (line 6):
registers:
  val = 1
stack:
  2
  fact-done

We jump to label at register continue (after-fact), state before goto (line 19):
registers:
  continue = fact-done
  n = 2
  val = n * val = 2
stack:
  empty

We jump to label at register continue (fact-done)
execution ends, register val has value 2.


; Fibonacci
(controller
   (assign continue (label fib-done))
 fib-loop
   (test (op <) (reg n) (const 2))
   (branch (label immediate-answer))
   ;; set up to compute Fib(n - 1)
   (save continue)
   (assign continue (label afterfib-n-1))
   (save n)                           ; save old value of n
   (assign n (op -) (reg n) (const 1)); clobber n to n - 1
   (goto (label fib-loop))            ; perform recursive call
 afterfib-n-1                         ; upon return, val contains Fib(n - 1)
   (restore n)
   (restore continue)
   ;; set up to compute Fib(n - 2)
   (assign n (op -) (reg n) (const 2))
   (save continue)
   (assign continue (label afterfib-n-2))
   (save val)                         ; save Fib(n - 1)
   (goto (label fib-loop))
 afterfib-n-2                         ; upon return, val contains Fib(n - 2)
   (assign n (reg val))               ; n now contains Fib(n - 2)
   (restore val)                      ; val now contains Fib(n - 1)
   (restore continue)
   (assign val                        ;  Fib(n - 1) +  Fib(n - 2)
           (op +) (reg val) (reg n)) 
   (goto (reg continue))              ; return to caller, answer is in val
 immediate-answer
   (assign val (reg n))               ; base case:  Fib(n) = n
   (goto (reg continue))
 fib-done)


Execution of (fib 3).
In fib-loop before goto (line 66):
registers:
  n = 2
  continue = afterfib-n-1
stack:
  3
  fib-done

Second iteration through fib-loop, before goto (line 66):
registers:
  n = 1
  continue = afterfib-n-1
stack:
  2
  afterfib-n-1
  3
  fib-done

Third iteration through fib-loop, test passes, so we branch to immediate-answer,
state before goto (line 85):
registers:
  n = 1
  continue = afterfib-n-1
  val = 1
stack:
  2
  afterfib-n-1
  3
  fib-done

Now we jump to afterfib-n-1, state before goto (line 75):
registers:
  n = 0
  continue = afterfib-n-2
  val = 1
stack:
  1
  afterfib-n-1
  3
  fib-done

Now we jump to fib-loop, test passes, so we branch to immediate-answer, state
before goto (line 85):
registers:
  n = 0
  continue = afterfib-n-2
  val = 0
stack:
  1
  afterfib-n-1
  3
  fib-done

We jump to afterfib-n-2 because it's a value of continue register, state before
goto (line 82):
registers:
  n = 0
  continue = afterfib-n-1
  val = 1
stack:
  3
  fib-done

Now we jump to label at register continue, it's current value is afterfib-n-1.
State before goto (line 75):
registers:
  n = 1
  continue = afterfib-n-2
  val = 1
stack:
  1
  fib-done

We jump to afterfib-n-2, state before goto (line 82):
registers:
  n = 1
  continue = fib-done
  val = 2
stack:

We jump to label saved in continue. We end up at fib-done. Execution ends with
a result in register val (2).
