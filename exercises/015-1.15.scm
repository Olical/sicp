;; Q: How many times is p applied when (sine 12.15) is applied? What is the order of growth and space for sine?

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine 12.15)
;; => -.39980345741334

;; Because p is in the tail position, it is held onto and stacked up as the sine calls keep drilling down.
;; Until (/ angle 3.0) has produced a small enough value, then that is returned and the stack is rolled up.

(/ 12.15 3.0)
(/ 4.05 3.0)
(/ 1.34999999999999999 3.0)
(/ 0.44999999999999999 3.0)
(/ 0.14999999999996666 3.0)
0.04999999999998889

;; So we got below 0.1 in 5 steps. In theory p is called 5 times, let's roll it up and check the answer.

(p (p (p (p (p 0.04999999999998889)))))
;; => -.39980345741581913
;; Close enough! Lost a little precision from copy and pasting though.

;; As far as big-O is concerned, space looks linear or better since the number of steps matched the stack used.
;; Steps are trickier I guess, because I am not great at math :| gonna double the input and see if the steps double.

(sine 24.3)
;; => -.7118002010039892

(/ 24.3 3.0)
(/ 8.1 3.0)
(/ 2.6999999999999997 3.0)
(/ 0.8999999999999999 3.0)
(/ 0.3 3.0)
0.09999999999999999

(p (p (p (p (p 0.09999999999999999)))))

;; Also 5, I would have to triple the input to see a increase of 1 to space or steps because of the division stack.
;; So it's O(log n) for both time and space!
