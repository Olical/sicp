;; Q: Design an iterative version of the fast-expt procedure, keeping it logarithmic in steps. Using successive squaring.

(define (book-fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (book-fast-expt b (/ n 2))))
        (else (* b (book-fast-expt b (- n 1))))))

(book-fast-expt 6 12)
;; => 2176782336

(define (fast-expt b n)
  (define (loop n a)
    (if (<= n 0)
        a
        (if (even? n)
          (loop (/ n 2) (square a))
          (loop (- n 1) (* a b)))))
  (loop n 1))

(fast-expt 6 12)
