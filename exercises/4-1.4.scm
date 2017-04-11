;; Q: Our model of evaluation allows for combinations whose operators are compound expressions. Describe the behaviour of the following procedure.

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; So the if is evaluated first. If b is more than 0, we can use +, if it's less than or equal to 0 it will use -.
;; Then it will apply a and b to whatever operator was selected.
;; This initial selection provides "abs" behaviour.
