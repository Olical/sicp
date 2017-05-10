;; Q: Design an iterative version of the fast-expt procedure, keeping it logarithmic in steps. Using successive squaring.

(define (book-fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (book-fast-expt b (/ n 2))))
        (else (* b (book-fast-expt b (- n 1))))))

(book-fast-expt 6 12)
;; => 2176782336

(define (fast-expt b n)
  (define (loop b n a)
    (if (<= n 0)
        a
        (loop b (- n 1) (* b a))))
  (loop b n 1))

(fast-expt 6 12)
