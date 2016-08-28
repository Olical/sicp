#lang sicp

; Yes, these are very simple. But I want to absorb every single part of this
; book. Deal with it.

10
; 10, duh

(+ 5 3 4)
; 12, lol math

(/ 6 2)
; 3, I wonder what (/ 6 0) gives you.
; Huh, a pretty neat divide by zero error, as you'd expect.

(+ (* 2 4) (- 4 6))
; Inside-out evaluation me-thinks.
; (* 2 4) = 8
; (- 4 6) = -2
; (+ 8 -2) = 6
; 6

(define a 3)
; 3

(define b (+ a 1))
; 4

(+ a b (* a b))
; (* 3 4) = 12
; (+ 3 4 12) = 19
; 19

(= a b)
; #f

(if (and (> b a) (< b (* a b)))
  b
  a)
; (> b a) = #t
; (* a b) = 12
; (< b 12) = #t
; b / 4

(cond ((= a 4) 6)
	  ((= b 4) (+ 6 7 a))
	  (else -1))
; (+ 6 7 a) = 16
; 16

(+ 2 (if (> b a) b a))
; (> b a) = #t
; (+ 2 b) = 6
; 6

(* (cond ((> a b) a)
		 ((< a b) b)
		 (else -1))
   (+ a 1))
; (< a b) = #t
; (+ a 1) = 4
; (* 4 4) = 16
; 16
