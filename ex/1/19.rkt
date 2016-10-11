#lang sicp

; I'm given a clever efficient Fibonacci procedure. I have to fill in the gaps.

(define (square n)
  (* n n))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (* 2 p q) (square q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 0) ; 0
(fib 1) ; 1
(fib 2) ; 1
(fib 3) ; 2
(fib 4) ; 3
(fib 5) ; 5
(fib 6) ; 8
(fib 10000) ; Big ass number, but it's faaaaaast.

; Had to read the first section of http://community.schemewiki.org/?sicp-ex-1.19
; Just couldn't work it out, I get it now that it was explained in the table.
; Not fully sure how they arrived at that, but glad I understand the overall concept.
; Yay, fast fib!
