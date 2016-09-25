#lang sicp

; Implementing Newtons method for cube roots.
;
; x/y^2 + 2y
; ----------
;     3

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (curt-iter guess prev x)
  (if (good-enough? guess prev x)
    guess
    (curt-iter (improve guess x) guess x)))

(define (good-enough? guess prev x)
  (< (abs (- (cube guess) (cube prev))) 0.001))

(define (improve guess x)
  (/ (+ (/ x (square guess))
	(* 2 guess))
     3))

(define (curt x)
  (curt-iter 1.0 0 x))

(curt 100) ; 4.64158883361313
(cube 4.64158883361313) ; 100.0000000000227

; Woo! :D
