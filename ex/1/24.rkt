#lang sicp

(#%require (only racket/base random))

; Using code from 1.23 but use the fast version of the prime test which is
; O(log n), so we should see times grow logarithmically.

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (square n)
  (* n n))

(define (fermat-test n) 
  (define (try-it a) 
    (= (expmod a n n) a)) 
  (try-it (+ 1 (random (- n 1))))) 

(define (fast-prime? n times) 
  (cond ((= times 0) true) 
        ((fermat-test n) (fast-prime? n (- times 1))) 
        (else false))) 

(define (expmod base exp m) 
  (cond ((= exp 0) 1) 
        ((even? exp) 
         (remainder (square (expmod base (/ exp 2) m)) 
                    m)) 
        (else 
          (remainder (* base (expmod base (- exp 1) m)) 
                     m))))

(timed-prime-test 1009) ; The first one is slow, so I call it twice. Caching? JIT?
(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)
(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)
(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)

; It's not the fast for low numbers, but the growth is REAAAAALY slow. I'd need
; a different random implementation to go high enough to really show it. But
; still. It's damn fast when you get into silly large numbers.
