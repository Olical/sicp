;; Q: What happens when this procedure version of if is used in sqrt-iter?

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

;; Because of applicative order evaluation, both branches of the if are executed before even being passed to new-if.
;; This means sqrt-iter is executed regardless.
;; It loops forever.
