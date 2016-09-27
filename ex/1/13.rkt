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
(define (magic! n)
  (/ (expt phi n) (sqrt 5)))

(fib 5) ; 5
(magic! 5) ; 4.959...

(fib 9) ; 34
(magic! 9) ; 33.994...

; WAT, that's actually amazing.

; I will leave the proving for tomorrow because I'm going to go watch some Mr Robot now.
