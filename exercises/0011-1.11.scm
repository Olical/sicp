;; A function f is defined by the rule that f(n) = n if n < 3 and f(n) = f(n -
;; 1) + 2f(n - 2) + 3f(n - 3) if n >= 3. Write a procedure that computes f by
;; means of a recursive process. Write a procedure that computes f by means of
;; an iterative process.

(define (fr n)
  (if (< n 3)
    n
    (+ (fr (- n 1))
       (* 2 (fr (- n 2)))
       (* 3 (fr (- n 3))))))

(fr 10)
;; => 1892

(define (fi n)
  (define (loop n x y z)
    (if (= n 0)
      x
      (loop (- n 1) y z (+ z (* 2 y) (* 3 x)))))
  (loop n 0 1 2))

(fi 10)
;; => 1892
