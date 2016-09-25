#lang sicp

; From 1.6
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

; Have to explain why the sqrt procedure is bad for very large and very small numbers.
; Smaller: If the number is small enough, we'll be within the 0.001 too quickly.
; Leaving us with a bad guess.

(sqrt 0.0003)                ; 0.03438350032699598
(square 0.03438350032699598) ; 0.001182225094736533

; Completely off. With large numbers I think it will do the same.
; It will have to iterate so much it will lose the precision.

(sqrt 123456789)            ; 11111.111060555555
(square 11111.111060555555) ; 123456788.99999999

; So large numbers get close, but not quite. Even with larger numbers than this
; it seems okay to be honest.

; Now to design a new "good-enough?" procedure.
; It should use the delta as the base case, when the delta is below a threshold
; we finish.

; So, I can't use the original structure, I need a whole new procedure.

(define (d-sqrt x)
  (d-sqrt-iter 1.0 0 x))

(define (d-sqrt-iter guess prev x)
  (if (d-good-enough? guess prev x)
    guess
    (d-sqrt-iter (improve guess x) guess x)))

(define (d-good-enough? guess prev x)
  (< (abs (- (square guess) (square prev))) 0.001))

; So now regular numbers, like 9, should give me 3.
(sqrt 9)   ; 3.00009155413138
(d-sqrt 9) ; 3.000000001396984

; Oh! Even closer!
; Small numbers?

(sqrt 0.0003)   ; 0.03438350032699598
(d-sqrt 0.0003) ; 0.021554307744124198

(square 0.03438350032699598)  ; 0.001182225094736533
(square 0.021554307744124198) ; 0.0004645881823284124

; Much closer :) large?

(sqrt 123456789)   ; 11111.111060555555
(d-sqrt 123456789) ; 11111.111060555555

; Huh, the same. Well, it's better for small numbers. Large seem okay though.
