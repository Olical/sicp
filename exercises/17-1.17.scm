;; Q: Design a logarithmic multiplication procedure using halve and double.

(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (mult a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (double (mult a (halve b))))
        (else (+ a (mult a (- b 1))))))

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
