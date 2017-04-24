;; Q: Here's two methods that add two positive integers. Show the processes they
;; generate with the substitution method. Are they iterative or recursive?

(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(define (p1 a b)
  (if (= a 0)
      b
      (inc (p1 (dec a) b))))

(define (p2 a b)
  (if (= a 0)
      b
      (p1 (dec a) (inc b))))

(p1 4 5)
(inc (p1 3 5))
(inc (inc (p1 2 5)))
(inc (inc (inc (p1 1 5))))
(inc (inc (inc (inc (p1 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

;; p1 is recursive because it is not tail call optimised.

(p2 4 5)
(p2 3 6)
(p2 2 7)
(p2 1 8)
(p2 0 9)
9

;; p2 is iterative since it uses O(1) space and is tail call optimised.
