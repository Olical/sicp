#lang sicp

; Ackerman's function is provided.

(define (ack x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (ack (- x 1)
		   (ack x (- y 1))))))

; Just have to see the results of these.
(ack 1 10)
(ack 2 4)
(ack 3 3)

; Now I have to give "concise mathematical definitions" for these.
(define (f n) (ack 0 n)) ; 2n
(define (g n) (ack 1 n)) ; 2^n
(define (h n) (ack 2 n)) ; ^n - Tetration, required Google help here :c
(define (k n) (* 5 n n)) ; 5n^2 - provided by the author.

(f 1) ; 2
(f 5) ; 10
(f 10) ; 20
(f 50) ; 100

(g 2) ; 4
(expt 2 2)
(g 98) ; 316912650057057350374175801344
(expt 2 98)

(h 1) ; 2
(h 2) ; 4
(h 3) ; 16
(h 4) ; 65536
; (h 5) ; F-ING MASSIVE, like two terminals worth of numbers.
