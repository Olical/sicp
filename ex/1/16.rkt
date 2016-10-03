#lang sicp

; Design a procedure that evolves an iterative exponentiation process that uses
; successive squaring and uses a logarithmic number of steps, as does
; fast-expt. (Hint: Using the observation that (b^n/2)^2 = (b^2)^n/2, keep, along
; with the exponent n and the base b, an additional state variable a, and
; define the state transformation in such a way that the product a bn is
; unchanged from state to state. At the beginning of the process a is taken to
; be 1, and the answer is given by the value of a at the end of the process. In
; general, the technique of defining an invariant quantity that remains
; unchanged from state to state is a powerful way to think about the design of
; iterative algorithms.)
;
; Bloody hell. That's a long one :|
; I think what they mean by this is take the given fast-expt but make it take O(1) space.

(define (book-fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (book-fast-expt b (/ n 2))))
        (else (* b (book-fast-expt b (- n 1))))))

(define (square n)
  (* n n))

(define (even? n)
  (= (remainder n 2) 0))

; So, I have to design a fast-expt that keeps track of a state variable.
; I'll compare the results in the lines after the procedures.

(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (square b) (/ n 2) a))
        (else (fast-expt-iter b (- n 1) (* b a)))))

; And they match :D
(book-fast-expt 5 5) ; 3125
(book-fast-expt 2 8) ; 256
(fast-expt 5 5) ; 3125
(fast-expt 2 8) ; 2
