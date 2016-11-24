;; Describe the behaviour of the following.

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

#|

Kinda self explanatory, will use + if b is positive or - if b is
negative to perform the given operation on a and b. This is
essentially like adding to an abs value of b.

|#

(a-plus-abs-b 10 5)
;; => 15

(a-plus-abs-b 10 -5)
;; => 15
