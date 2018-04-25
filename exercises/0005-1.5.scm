;; Here's a test that checks for normal or applicative order evaluation.

(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

(test 0 (p))

;; In applicative order: It'll iterate forever because (p) is evaluated
;; at application time and (p) is infinitely recursive.

;; In normal order: We get 0 because the else branch isn't reached so
;; (p) is never actually executed.
