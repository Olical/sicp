;; Q: f is defined by the following rules.
;; f(n) = n if n < 3
;; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3
;; Write two procedures that compute f by means of recursive and iterative processes.

(define (f-recur n)
  (if (< n 3)
      n
      (+ (f-recur (- n 1))
         (* 2 (f-recur (- n 2)))
         (* 3 (f-recur (- n 3))))))

(f-recur 5) ;; 25
(f-recur 10) ;; 1892

;; Okay, the recursive definition is easy enough because the actual question is recursive.
;; But that process grows massively, every call splits into three calls, which each split into three more.
;; A tail recursive version would need to hold onto the accumulation of the addition part.
;; It will need to hold all three branches and iterate over them.

;; The thing that triggers the rollup is "n - 1" happening recursively.
;; So my base case of the loop will still be n as it decrements.
;; The step should be to recur on the addition of n and the other two branches.

(define (f-iter n)
  (define (loop a b c n)
    (if (< n 3)
        a
        (loop (+ a (* 2 b) (* 3 c))
              a
              b
              (- n 1))))
  (if (< n 3)
      n
      (loop 2 1 0 n)))

(f-iter 5) ;; 25
(f-iter 10) ;; 1892
