#lang sicp

; Square root. code exapmles first.
; I'll need to describe it and the recursion it uses.
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
; Should give us 3-ish, as per the example.

; Now they define a new-if statement.
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(new-if (= 2 3) 0 5) ; 5
(new-if (= 1 1) 0 5) ; 0

; Now we define a new square-iter using it.
(define (new-if-sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (new-if-sqrt-iter (improve guess x) x)))

(define (new-if-sqrt x)
  (new-if-sqrt-iter 1.0 x))

; What happens when this one executes?
; Well, since both sides are evaluated there is no base case.
; It will recur forever!
; (new-if-sqrt 9) never completes.
