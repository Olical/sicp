#|
The sqrt implementation is not great for very small or large numbers
since we lose precision. I'll implement an alternative approach that
essentially looks for a tiny delta instead.

The reason it doesn't work very well is because we'd need to adjust
the 0.01 threshold depending on the size of the input. If you use a
relative value (from one guess to another) then it should work at any
size, essentially.
|#

(define (sqrt-iter guess prev x)
  (if (good-enough? guess prev)
      guess
      (sqrt-iter (improve guess x)
                 guess
                 x)))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess prev)
  (< (abs (- guess prev)) 0.0001))

(define (sqrt x)
  (sqrt-iter 1.0 0.0 x))

;; With the old good-enough?

;; (define (good-enough? guess x)
;;   (< (abs (- (square guess) x)) 0.01))

;; (square (sqrt 0.0001))
;; => 3.9728

;; With the new good-enough?

(square (sqrt 12345678910))
;; => 12345678910.0

(square (sqrt 0.0001))
;; => 1.0000000050981486e-4 (a.k.a ~0.0001)
