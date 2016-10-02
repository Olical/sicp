#lang sicp

; Given this sine procedure.

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))

; How many times is p applied when (sine 12.15) is evaluated?
; p is applied at the end of the stack as it rolls up, so this means it's
; applied as many times as it takes to get angle under 0.1 when dividing by 3.
; That's five times in this case.

; What is the order of growth in space and number of steps?
; Because it's tied directly to how much you have to divide the input and the
; space is tied to the steps which is tied to the size of the angle: It's O(log n)
