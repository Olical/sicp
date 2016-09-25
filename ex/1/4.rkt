#lang sicp

; This is provided.
; Just have to describe behaviour.
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; So if b is greater than zero we add a and b together.
; If it's less than or equal to, we negate b from a.
; This is essentially the same as getting the absolute of b first.
; Hence the name.

(a-plus-abs-b 3 4)
(a-plus-abs-b 3 -4)

; So those are equivalent.
