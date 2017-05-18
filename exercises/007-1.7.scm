;; Q: good-enough? is not very effective for extremely large and small numbers. Why?

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; Normal numbers work fine.
(sqrt 5) ;; 2.236...

;; Tiny numbers exit too early because they drop below the good-enough? threshold too quickly.
(sqrt 0.0000001) ;; 0.031... when it should be 0.0003...

;; Really large numbers don't have the precision.
;; So this number should have 50+ numbers after the point, it has far less.
(sqrt 12345678910)

;; So now here's a version of sqrt that uses the delta to check if it's good enough.
(define (d-good-enough? guess prev)
  (< (abs (- guess prev)) 0.00001))

(define (d-sqrt-iter guess prev x)
  (if (d-good-enough? guess prev)
      guess
      (d-sqrt-iter (improve guess x)
                   guess
                   x)))

(define (d-sqrt x)
  (d-sqrt-iter 1.0 0.0 x))

;; Now tiny numbers are accurate!
(d-sqrt 0.0000001)

;; And larger ones are okay.
(d-sqrt 5) ;; 2.236
(d-sqrt 12345678910)
