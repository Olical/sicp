#lang sicp

(#%require (only racket/base random))

; The question was if I replaced expmod with a call to fast-expt then remainder
; of that, it'd be faster / better. Although it yields the correct results, it
; does so MUCH slower.
;
; The book gives us the answer when describing the expmod procedure.
;
; The reduction steps in the cases where the exponent e is greater than 1 are
; based on the fact that, for any integers x, y, and m, we can find the
; remainder of x times y modulo m by computing separately the remainders of x
; modulo m and y modulo m, multiplying these, and then taking the remainder of
; the result modulo m. For instance, in the case where e is even, we compute
; the remainder of be/2 modulo m, square this, and take the remainder modulo m.
; This technique is useful because it means we can perform our computation
; without ever having to deal with numbers much larger than m.
;
; So it's just because there's a trick to expmod that someone found. If you
; perform a naive implementation (like I would) you end up with something that
; works, but you're not using this awesome shortcut.

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
  (remainder (fast-expt base exp) m))

(define (fast-expt b n)
   (cond ((= n 0) 1)
         ((even? n) (square (fast-expt b (/ n 2))))
         (else (* b (fast-expt b (- n 1))))))

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
