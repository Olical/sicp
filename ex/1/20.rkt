#lang sicp

; Here's Euclid's Algorithm for greatest common divisor.

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

; How many times is remainder called in applicative and normal order evaluation.
; Where normal order is just lazy, it delays evaluation until the argument is required.
; Input is (gcd 206 40)

; Applicative
(remainder 206 40) ; 6
(remainder 40 6) ; 4
(remainder 6 4) ; 2
(remainder 4 2) ; 0
; 2

; Normal
; It performs 18, it performs a series of expand and contract calls.
; It essentially gets a level deeper, evaluates the whole stack to perform =,
; then go another level deeper.
