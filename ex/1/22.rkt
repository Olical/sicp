#lang sicp

; Using the provided timed-prime-test I have to define a procedure that tests
; consecutive odd integers in a specified range for primality. Find the three
; smallest primes greater than 1000, 10,000, 100,000 and 1,000,000.
;
; Testing for primes around 10,000 should take (sqrt 10) times longer than 1000
; because it's O(sqrt n).

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

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n)
  (* n n))

(define (prime? n)
  (= (smallest-divisor n) n))

; Here's where my code begins.
(define (timed-prime-test-range a b)
  (if (even? a)
    (timed-prime-test-range (+ a 1) b)
    (cond
      ((< a b) (begin
                 (timed-prime-test a)
                 (timed-prime-test-range (+ a 2) b))))))

(timed-prime-test-range 1000 1020) ; 1009, 1013 and 1019.
(timed-prime-test-range 10000 10038) ; 10007, 10009 and 10037.
(timed-prime-test-range 100000 100045) ; 100003, 100019 and 100043.
(timed-prime-test-range 1000000 1000039) ; 1000003, 1000033 and 1000037.

; 1k - 1ms
; 10k - 3ms
; 100k - 6ms
; 1000k - 17ms
