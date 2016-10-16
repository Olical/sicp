#lang sicp

(#%require (only racket/base random))

; I have to implement the Miller Rabin test, which is essentially Fermat but foolproof.
; Had to cheat, didn't know where to even begin, had a rough idea but couldn't work it out.
; I just got lazy for this one :(
; I understand it though, so there's that.

(define (square-check x m)
  (if (and (not (or (= x 1) (= x (- m 1))))
           (= (remainder (* x x) m) 1))
      0
      (remainder (* x x) m)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (square-check (expmod base (/ exp 2) m) m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (miller-rabin-test n)
  (define (try-it a)
     (= (expmod a (- n 1) n) 1))
  (try-it (+ 2 (random (- n 2)))))

(miller-rabin-test 7)
(miller-rabin-test 561)
(miller-rabin-test 1105)
(miller-rabin-test 1729)
(miller-rabin-test 2465)
(miller-rabin-test 2821)
(miller-rabin-test 6601)
