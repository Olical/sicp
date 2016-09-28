#lang sicp

; So this one scares me a little (a lot).
; Q: Prove that Fib(n) is the closest integer to Φ^n/(sqrt 5), where Φ = (1 + (sqrt 5))/2
; Hint: Let ψ = (1 - (sqrt 5))/2
; Use induction to prove that Fib(n) = (Φ^n - ψ^n)/(sqrt 5)
;
; Well then. Time to use that math thing I've been hearing about.
;
; So I know that Φ^n = Φ+1 because feckin' magnets.
; Let's do this the only way I know how, TRIAL AND ERROR AND ERROR AND ERROR!

; Define a few constants, mentioned above.
(define phi (/ (+ 1 (sqrt 5)) 2)) ; Φ
(define psi (/ (- 1 (sqrt 5)) 2)) ; ψ

; Look at this magic!
(= (* phi phi) (+ phi 1)) ; #t, still amazed.

; Pull in my Fibonacci implementation.
(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

; Define the rule that I'm proving.
(define (magic-fib n)
  (round (/ (expt phi n) (sqrt 5))))

; Let's compare the results
(= (fib 0) (magic-fib 0))
(= (fib 1) (magic-fib 1))
(= (fib 2) (magic-fib 2))
(= (fib 5) (magic-fib 5))
(= (fib 9) (magic-fib 9))
(= (fib 50) (magic-fib 50))
(= (fib 100) (magic-fib 100)) ; They're true up until here, I think because of precision.
(= (fib 500) (magic-fib 500))

; WAT, that's actually amazing.

; Now to define the other approach.
(define (alt-magic-fib n)
  (round (/ (- (expt phi n) (expt psi n)) (sqrt 5))))

; And time to test the other approach.
(= (fib 0) (alt-magic-fib 0))
(= (fib 1) (alt-magic-fib 1))
(= (fib 2) (alt-magic-fib 2))
(= (fib 5) (alt-magic-fib 5))
(= (fib 9) (alt-magic-fib 9))
(= (fib 50) (alt-magic-fib 50))
(= (fib 100) (alt-magic-fib 100)) ; They're true up until here, I think because of precision.
(= (fib 500) (alt-magic-fib 500))

; I think this is the same because phi and psi appear to be inverses of each other.
; So I don't know how to prove this through induction, I just have no idea.
; I can kind of get it through intuition, but I can't do a proper induction.
; Bill the Lizard explained it beautifully: http://www.billthelizard.com/2009/12/sicp-exercise-113-fibonacci-and-golden.html
; I learned a lot there, but I still couldn't do it on my own. Sorry :(
