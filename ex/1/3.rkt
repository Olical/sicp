#lang sicp

; Procedure that takes three numbers and returns the sum of the squares of the
; two larger numbers.

(define (square x) (* x x))

(define (largest x y) (if (> x y) x y))

(define (sum-squares x y)
  (+ (square x) (square y)))

(define (largest-pair-square-sum a b c)
  (if (= a (largest a b))
    (sum-squares a (largest b c))
    (sum-squares b (largest a c))))

(largest-pair-square-sum 10 5 20)
; So it should pick 10 and 20.
; Square them, giving us 100 and 400.
; Then add them together, which is 500.
