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
What should happen? I'm guessing it's a question of "where will it lock up?"
or "when will it lock up?". It will be different depending on the style of
interpreter we use.

So Scheme uses applicative order, that means the arguments are evaluated at
invocation time. So it hits the (p) and chokes. In normal order, it will only
use the arguments if it needs to.

In my head I see this as top down / bottom up. Scheme is top down so it must
evaluate the arguments as early as possible.

I guess both methods have good and bad things about them. Both are interesting.
|#
