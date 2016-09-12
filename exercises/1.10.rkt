#lang sicp

; Ackerman's function is provided.

(define (ack x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (ack (- x 1)
		   (ack x (- y 1))))))

; I have to work out what the following calls give me.
; (ack 1 10)
; (ack 2 4)
; (ack 3 3)
