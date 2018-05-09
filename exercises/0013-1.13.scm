;; Prove that fib(n) is the closest integer to phi^n / sqrt(5) where phi = (1 + sqrt(5)) / 2.
;; Hint: Let psy = (1 - sqrt(5)) / 2. Use induction and the definition of the Fibonacci numbers
;; to prove that fib(n) = (phi^n - psy^n) / sqrt(5)

;; So let's define the given constants:

(define /5 (sqrt 5))
(define phi (/ (+ 1 /5) 2))
(define psy (/ (- 1 /5) 2))

;; And a fib function:

(define (fib n)
  (define (loop a b count)
    (if (= count 0)
      b
      (loop (+ a b) a (- count 1))))
  (loop 1 0 n))

;; Let's check what we get by comparing fib and the phi approaches:

(fib 8)
;; => 21

(/ (expt phi 8) /5)
;; => 21.00951949424901

;; Pretty damn cool. So now I need to prove this is the same for all n:

; fib(n+1) = fib(n) + fib(n-1)
