;; Pascal's triangle looks like this:

;;         1
;;       1   1
;;     1   2   1
;;   1   3   3   1
;; 1   4   6   4   1

;; The numbers at the edge of the triangle are all 1, and each number inside
;; the triangle is the sum of the two numbers above it. Write a procedure that
;; computes elements of Pascal's triangle by means of a recursive process.

(define (pascal x y)
  (if (or (= x 0) (= x y))
    1
    (+ (pascal (- x 1) (- y 1))
       (pascal x (- y 1)))))

(pascal 0 0)
;; => 1

(pascal 0 1)
;; => 1

(pascal 1 2)
;; => 2

(pascal 3 4)
;; => 4
