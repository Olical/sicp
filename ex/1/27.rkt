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

(define (carmichael? n)
  (define (loop n a)
    (if (= a 0)
      true
      (if (= (remainder (expt a n) n)
             (remainder a n))
        (loop n (- a 1))
        false)))
  (loop n n))

(carmichael? 20) ; This is not a Carmichael number.
(carmichael? 561) ; The rest are.
(carmichael? 1105)
(carmichael? 1729)
(carmichael? 2465)
(carmichael? 2821)
(carmichael? 6601)
