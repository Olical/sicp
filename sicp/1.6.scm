;; Given this new definition of if.

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;; And this definition of sqrt.

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.01))

(define (sqrt x)
  (sqrt-iter 1.0 x))

#|
So, what's wrong with this? When you try to calculate square roots
with it, it hits the maximum recursion depth and dies. This implies a
non-tail recursive call, this is because new-if is not a macro, it
does not decide which branch to execute. Both branches are executed
but one value is returned, so for simple operations it looks okay, as
soon as you throw recursion in you'll never hit your base case.
|#
