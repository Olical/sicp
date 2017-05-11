;; Q: Compute p and q inside this procedure's `even?` branch.
;; I don't really understand the question since it involves a lot of math, but I'll give it a go.

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (* 2 (* p q)) (square q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 3)
;; => 2

(fib 10)
;; => 55

(fib 15)
;; => 610

(fib 20)
;; => 6765
