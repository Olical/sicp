;; Newton's method for cube roots is based on the fact that if y is an
;; approximation to the cube root of x, then a better approximation is
;; given by the value

;; x/y^2 + 2y
;; ----------
;;     3

;; Use this to implement a cube-root procedure analogous to the square
;; root procedure.

;; I'd expect the cube root of 10 to be 2.15443469003.

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* guess 2))
     3))

(define (good-enough? guess prev-guess)
  (< (abs (- guess prev-guess)) 0.00000001))

(define (curt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
    guess
    (curt-iter (improve guess x) guess x)))

(define (curt x)
  (curt-iter 1.0 0.0 x))

(curt 10)
;; => 2.154434690031884
