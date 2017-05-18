;; Q: Design an iterative version of the fast-expt procedure, keeping it logarithmic in steps. Using successive squaring.

(define (book-fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (book-fast-expt b (/ n 2))))
        (else (* b (book-fast-expt b (- n 1))))))

(book-fast-expt 2 8)
;; => 256

(book-fast-expt 5 5)
;; => 3125

(book-fast-expt 6 12)
;; => 2176782336

(define (fast-expt b n)
  (define (loop b n a)
    (cond ((= n 0) a)
          ((even? n) (loop (square b) (/ n 2) a))
          (else (loop b (- n 1) (* b a)))))
  (loop b n 1))

(fast-expt 2 8)
;; => 256

(fast-expt 5 5)
;; => 3125

(fast-expt 6 12)
;; => 2176782336
