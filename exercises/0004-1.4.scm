;; Our model of evaluation allows for combinations whose operators are compound
;; expressions. Use this to describe the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 10 -10)
(a-plus-abs-b 10 10)

;; So we're using if to select a function to apply a and b to. If b is
;; greater than 0 we use +, so the function acts like a normal addition.
;; If it's 0 or less we use -, which is equivalent to performing abs on b.
