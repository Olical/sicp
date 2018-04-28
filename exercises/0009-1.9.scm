;; Given these two procedures that add two numbers using dec and inc:

(define (+ a b)
  (if (= a 0)
    b
    (inc (+ (dec a) b))))

(define (+ a b)
  (if (= a 0)
    b
    (+ (dec a) (inc b))))

;; Use the substitution model to illustrate the processes generated after
;; evaluating (+ 4 5). Are the processes iterative or recursive?

;; So it's pretty clear the first one is recursive and the second is iterative.
;; This is because the recursive call back to + in the second one is in the
;; tail position, so it'll generate an iterative process.

;; First one:

(+ 4 5)
(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

;; Second one:

(+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)
9

;; This probably isn't exactly the substitution model but it's close enough.
;; You get the idea and it's gone midnight, I want to go to sleep.
