;; Define a procedure that takes three numbers as arguments
;; and returns the sum of the squares of the two larger
;; numbers.

(define (square n)
  (* n n))

(define (sum-square-largest-2 . xs)
  (apply + (map square (take (sort xs >) 2))))

(sum-square-largest-2 10 5 20)
;; => 500
