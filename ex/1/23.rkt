#lang sicp

; Using code from 1.22, I have to make it so that smallest-divisor uses a new
; procedure called next which skips even numbers. Then I have to run the 12
; primes form the last exercise through this improved timed test, it should be
; faster.

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (next n)
  (if (= n 2)
    3
    (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n)
  (* n n))

(define (prime? n)
  (= (smallest-divisor n) n))

; Previous primes and times.
; 1009, 1013 and 1019.
; 10007, 10009 and 10037.
; 100003, 100019 and 100043.
; 1000003, 1000033 and 1000037.

; 1k - 1ms
; 10k - 3ms
; 100k - 6ms
; 1000k - 17ms

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

; Before:
; 1009 *** 1
; 1013 *** 1
; 1019 *** 1
; 10007 *** 2
; 10009 *** 2
; 10037 *** 2
; 100003 *** 19
; 100019 *** 6
; 100043 *** 5
; 1000003 *** 16
; 1000033 *** 16
; 1000037 *** 36

; After:
; 1009 *** 1
; 1013 *** 1
; 1019 *** 1
; 10007 *** 1
; 10009 *** 1
; 10037 *** 1
; 100003 *** 3
; 100019 *** 3
; 100043 *** 3
; 1000003 *** 9
; 1000033 *** 9
; 1000037 *** 8

; It's twice as fast :D
