;; Q: Design a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

(define (square n)
  (* n n))

;; Sum Squares of Larger Pair
(define (sslp a b c)
  (if (> a b)
      (+ (square a) (square (if (> b c) b c)))
      (+ (square b) (square (if (> a c) a c)))))

;; If it selects the two largest numbers we should get...
(+ (square 2) (square 3))
;; => 13

(sslp 1 2 3)
;; => 13

(sslp 3 2 1)
;; => 13

(sslp 2 3 1)
;; => 13

(sslp 1 3 2)
;; => 13

(sslp 1 1 1)
;; => 2

;; I could make this smaller using helper methods like "max" but I like the simplicity of this.
