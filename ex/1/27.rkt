#lang sicp

; Write a procedure that proves the following numbers fool the Fermat test.
; They are Carmichael numbers.
;
; 561
; 1105
; 1729
; 2465
; 2821
; 6601

(define (square n)
  (* n n))

(define (fermat? n a)
  (= (expmod a n n) a))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (fermat-all n)
  (define (iter a)
    (cond ((= a 1) true)
          ((not (fermat? n a)) false)
          (else (iter (- a 1)))))
  (iter (- n 1)))

(fermat-all 20) ; This is not a Carmichael number.
(fermat-all 561) ; The rest are.
(fermat-all 1105)
(fermat-all 1729)
(fermat-all 2465)
(fermat-all 2821)
(fermat-all 6601)
