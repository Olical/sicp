;; Implement cube root using Newtons method.

;; x/y^2 + 2y
;; ----------
;;     3

(define (curt-iter guess prev x)
  (if (good-enough? guess prev)
      guess
      (curt-iter (improve guess x)
                 guess
                 x)))

(define (improve y x)
  (/ (+ (/ x (expt y 2)) (* 2.0 y))
     3.0))

(define (good-enough? guess prev)
  (< (abs (- guess prev)) 0.0001))

(define (curt x)
  (curt-iter 1.0 0.0 x))

(define (cube n)
  (* n n n))

(cube (curt 10))
;; => 10.000000024234794
