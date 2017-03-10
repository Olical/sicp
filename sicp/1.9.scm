;; Given these two procedures that add two numbers together.

(define (inc n) (+ n 1))
(define (dec n) (- n 1))

(define (+a a b)
  (if (= a 0)
      b
      (inc (+a (dec a) b))))

(define (+b a b)
  (if (= a 0)
      b
      (+b (dec a) (inc b))))

;; I need to illustrate the processes these procedures generate for (+ 4 5).

(+a 4 5)
(inc (+a (dec 4) 5))
(inc (+a 3 5))
(inc (inc (+a (dec 3) 5)))
(inc (inc (+a 2 5)))
(inc (inc (inc (+a (dec 2) 5))))
(inc (inc (inc (+a 1 5))))
(inc (inc (inc (inc (+a (dec 1) 5)))))
(inc (inc (inc (inc (+a 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

;; So this is not tail recursive, it has to hold this stack of increments.

(+b 4 5)
(+b (dec 4) (inc 5))
(+b 3 6)
(+b (dec 3) (inc 6))
(+b 2 7)
(+b (dec 2) (inc 7))
(+b 1 8)
(+b (dec 1) (inc 8))
(+b 0 9)
9

;; This is liniar on the CPU and tail recursive in the language.
