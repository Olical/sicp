;; Q: Write a procedure that demonstrates Carmichael numbers.
;; Those that fool the Fermat test.
;; Take an integer n, test if a^n is congruent to a modulo n for every a < n.

;; Test on 561, 1105, 1729, 2465, 2821 and 6601.

;; Two numbers are said to be "congruent modulo n" if they both have the same remainder when divided by n.

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (congruent? a b)
  (= (expmod a b b) (remainder a b)))

(define (carmichael? n)
  (define (loop a)
    (if (< a n)
        (if (congruent? a n)
            (loop (+ a 1))
            false)
        true))
  (loop 0))

(carmichael? 20)
;; => #f (as expected)

(carmichael? 561)
;; => #t
(carmichael? 1105)
;; => #t
(carmichael? 1729)
;; => #t
(carmichael? 2821)
;; => #t
(carmichael? 6601)
;; => #t

(carmichael? 7829)
;; => #t <-- THIS IS NOT EXPECTED, IT IS NOT A CARMICHAEL NUMBER
(carmichael? 9827)
;; => #f (as expected)

;; Something is really strange about 7829 which I picked at random, maybe it's a Carmichael number after all?
