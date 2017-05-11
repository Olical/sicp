;; Q: Design an iterative logarithmic multiplication procedure using halve and double. Based on 1.16 and 1.17.

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (mult a b)
  (define (loop a b acc)
    (cond ((= b 0) acc)
          ((even? b) (loop (double a) (halve b) acc))
          (else (loop a (- b 1) (+ a acc)))))
  (loop a b 0))

(mult 0 0)
;; => 0

(mult 2 5)
;; => 10

(mult 11 2)
;; => 22

(mult 9 4)
;; => 36

;; Some assorted multiplications to compare to.

(* 0 0)
;; => 0

(* 2 5)
;; => 10

(* 11 2)
;; => 22

(* 9 4)
;; => 36
