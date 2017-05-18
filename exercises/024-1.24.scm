;; Q: Use the code from 1.22, but use the fast-prime? procedure.

;; Prime checking procedures.

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 10)))
        (else false)))

;; Timing procedures.

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time))
      false))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  true)

;; Range checking of primes using timers.

(define (search-for-primes n end count)
  (if (and (> count 0) (< n end))
      (if (odd? n)
          (let ((res (timed-prime-test n)))
            (search-for-primes (+ n 1)
                               end
                               (if res (- count 1) count)))
          (search-for-primes (+ n 1) end count))))

(search-for-primes 1000 5000 3)
;; =>
;;    1001
;;    1003
;;    1005
;;    1007
;;    1009 *** 0.
;;    1011
;;    1013 *** 0.
;;    1015
;;    1017
;;    1019 *** 0.
;;    #!unspecific

(search-for-primes 10000 50000 3)
;; =>
;;    10001
;;    10003
;;    10005
;;    10007 *** 0.
;;    10009 *** 0.
;;    10011
;;    10013
;;    10015
;;    10017
;;    10019
;;    10021
;;    10023
;;    10025
;;    10027
;;    10029
;;    10031
;;    10033
;;    10035
;;    10037 *** 0.
;;    #!unspecific

(search-for-primes 100000 500000 3)
;; =>
;;    100001
;;    100003 *** 0.
;;    100005
;;    100007
;;    100009
;;    100011
;;    100013
;;    100015
;;    100017
;;    100019 *** 0.
;;    100021
;;    100023
;;    100025
;;    100027
;;    100029
;;    100031
;;    100033
;;    100035
;;    100037
;;    100039
;;    100041
;;    100043 *** 0.
;;    #!unspecific

(search-for-primes 1000000 5000000 3)
;; =>
;;    1000001
;;    1000003 *** 0.
;;    1000005
;;    1000007
;;    1000009
;;    1000011
;;    1000013
;;    1000015
;;    1000017
;;    1000019
;;    1000021
;;    1000023
;;    1000025
;;    1000027
;;    1000029
;;    1000031
;;    1000033 *** 0.
;;    1000035
;;    1000037 *** 0.
;;    #!unspecific
