;; Q: Write a procedure to compute elements of Pascal's triangle by means of a recursive process.

(define (edge? x y)
  (or (<= x 0)
      (<= y 0)
      (= x y)
      (> x y)))

(define (pascal x y)
  (if (edge? x y)
      1
      (+ (pascal (- x 1) (- y 1))
         (pascal x (- y 1)))))

;; The tip of the triangle.

(pascal 0 0) ;; 1

(pascal 0 1) ;; 1

(pascal 1 1) ;; 1

(pascal 0 2) ;; 1

;; The middle of the peak.
(pascal 1 2) ;; 2

(pascal 2 2) ;; 1

;; The rest...

(pascal 0 3) ;; 1

(pascal 1 3) ;; 3

(pascal 2 3) ;; 3

(pascal 3 3) ;; 1

(pascal 0 4) ;; 1

(pascal 1 4) ;; 4

(pascal 2 4) ;; 6

(pascal 3 4) ;; 4

(pascal 4 4) ;; 1
