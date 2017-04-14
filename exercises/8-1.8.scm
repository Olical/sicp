;; Q: Implement Newton's cube root.

;; x/y^2 + 2y
;; ----------
;;     3

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess prev)
  (< (abs (- guess prev)) 0.00001))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* guess 2)) 3))

(define (curt-iter guess prev x)
  (if (good-enough? guess prev)
      guess
      (curt-iter (improve guess x)
                 guess
                 x)))

(define (curt x)
  (curt-iter 1.0 0.0 x))

;; Cube root of 15 should be 2.46621207433
(curt 15)
