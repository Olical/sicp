;; Given this new definition of if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;; And this usage in sqrt-iter:

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

;; What happens when it is executed?

;; Well it'll explode and loop forever because even if the predicate returns
;; true the else branch will always be executed. It doesn't conditionally
;; execute the branches because of the applicative evaluation.
