#lang sicp

; I've done exponation through repeated multiplication. Here's multiplication
; using add.

; (define (* a b)
;   (if (= b 0)
;     0
;     (+ a (* a (- b 1)))))

; Now we are given a double and halve as procedures. I have to design a
; logarithmic step version of the procedure above.

(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))

(define (mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (mult a (halve b))))
        (else (+ a (mult a (- b 1))))))

(mult 0 1) ; 0
(mult 1 1) ; 1
(mult 1 2) ; 2
(mult 3 5) ; 15
(mult 2 10) ; 20
(mult 100 2) ; 200
