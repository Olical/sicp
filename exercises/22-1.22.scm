;; Q: Use timed prime tests to find the three smallest primes greater than 1000, 10000, 100000 and 1000000.
;; Does 10k take (sqrt 10) times longer than 1k? Is running time proportional to steps taken?

;; Prime checking procedures.

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;; Timing procedures.

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

;; Range checking of primes using timers.

(define (search-for-primes n end count)
  (when (or (> count 0) (< n end))
    (timed-prime-test n)
    (search-for-primes (+ n 1) end count)))

(search-for-primes 3 5 3)
