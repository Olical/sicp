;; Q: This procedure determines if the interpreter uses applicative or normal order evaluation.

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;; When this is evaluated...

(test 0 (p))

;; Q: What happens under applicative: It loops at the call to test because (p) never ends.
;; Q: What happens under normal: It will return 0 if x is 0, but lock if x is not 0.
