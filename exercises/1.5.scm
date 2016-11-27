;; Given hese two procedures.

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;; And this expression.

(test 0 (p))

;; How will this behave in applicative and normal order evaluation interpreter.

#|
Scheme is applicative order, so things are evaluated at application
time (when you execute a procedure). Normal order will evaluate
something when it is actually required. So for scheme, this locks up
before test is even called because (p) is an argument that loops
forever and it must be evaluated before test. In normal order (which)
is almost lazy in a way the first condition of test will match and it
will return 0. It will not execute p since the if branch did not touch it.
|#
