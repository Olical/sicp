#lang sicp

; A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1)
; + 2f(n - 2) + 3f(n - 3) if n> 3. Write a procedure that computes f by means
; of a recursive process. Write a procedure that computes f by means of an
; iterative process.

; As an example you can transform Fibonacci from recursive to iterative like so.

; (define (fib n)
;   (cond ((= n 0) 0)
;         ((= n 1) 1)
;         (else (+ (fib (- n 1))
;                  (fib (- n 2))))))
;
; ---------------------------------------------
;
; (define (fib n)
;   (fib-iter 1 0 n))
;
; (define (fib-iter a b count)
;   (if (= count 0)
;       b
;       (fib-iter (+ a b) a (- count 1))))

; The recursive procedure is almost a direct translation.
; It executes as a tree though, which is inefficient.
(display "recur...\n")
(define (recur-f n)
  (if (< n 3)
    n
    (+ (recur-f (- n 1))
       (* 2 (recur-f (- n 2)))
       (* 3 (recur-f (- n 3))))))

(recur-f 0) ; 0
(recur-f 1) ; 1
(recur-f 2) ; 2
(recur-f 3) ; 4
(recur-f 4) ; 11
(recur-f 5) ; 25

; The iterative procedure just needs to hold onto the state.
(display "\niter...\n")
(define (iter-f n)
  (if (< n 3)
    n
    (iter-f-aux 2 1 0 n)))

; I honestly needed to lookup help for this, which is annoying me.
; I understand it now, but I just couldn't work out how to flatten it.
; I now see that there is a main accumulator in the form of a.
; We use n as our countdown (all of this is so similar to Fibonacci).
; c is just the previous b. I wish I had worked this out myself :c
(define (iter-f-aux a b c n)
  (if (< n 3)
    a
    (iter-f-aux (+ a (* 2 b) (* 3 c))
                a
                b
                (- n 1))))

(iter-f 0) ; 0
(iter-f 1) ; 1
(iter-f 2) ; 2
(iter-f 3) ; 4
(iter-f 4) ; 11
(iter-f 5) ; 25
