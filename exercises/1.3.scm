;; Define a procedure that takes three numbers and sums the square of the two larger numbers.

(define (square x)
  (* x x))

(define (largest x y)
  (if (> x y) x y))

(define (sum-squares x y)
  (+ (square x) (square y)))

(define (sum-square-largest-pair a b c)
  (if (= a (largest a b))
    (sum-squares a (largest b c))
    (sum-squares b (largest a c))))

(sum-square-largest-pair 1 5 10)
;; => 125
