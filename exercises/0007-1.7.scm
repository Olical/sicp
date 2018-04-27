;; The given square root implementation uses a good-enough? procedure that
;; isn't great for very small numbers. This is because we're checking if a
;; number is within a tolerance, if the number in question is smaller than that
;; tolerance anyway... it just says "yep, we're done".

;; It doesn't go into high enough precision. The way around this is to measure
;; the change between this guess and the last one, when that change gets
;; EXTREMELY small, we can stop.

;; Here's the original implementation.

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 10)
;; => 3.162277665175675

(sqrt 0.000000005)
;; => .03125005328123188
;; Should be => 0.00007071067

;; Now for my one that works for tiny tiny numbers.

(define (better-good-enough? guess prev-guess)
  (< (abs (- guess prev-guess)) 0.00000001))

(define (better-sqrt-iter guess prev-guess x)
  (if (better-good-enough? guess prev-guess)
    guess
    (better-sqrt-iter (improve guess x) guess x)))

(define (better-sqrt x)
  (better-sqrt-iter 1.0 0.0 x))

(better-sqrt 10)
;; => 3.162277660168379

(better-sqrt 0.000000005)
;; => 0.00007071067811865477
