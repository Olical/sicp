#lang sicp

; Implement multiplication in terms of adding, doubling and halving as an
; iterative process in a logarithmic number of steps. This is pretty much a
; combination of 1.16 and 1.17.

(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))

(define (mult a b)
  (mult-iter a b 0))

(define (mult-iter a b acc)
  (cond ((= b 0) acc)
        ((even? b) (mult-iter (double a) (halve b) acc))
        (else (mult-iter a (- b 1) (+ a acc)))))

(mult 0 1) ; 0
(mult 1 1) ; 1
(mult 1 2) ; 2
(mult 3 5) ; 15
(mult 2 10) ; 20
(mult 100 2) ; 200
