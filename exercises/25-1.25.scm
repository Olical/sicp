;; Q: Given this different expmod (when compared to 1.24), why is it not suitable?

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

;; It is slower because it deals with larger numbers earlier.
;; Operations on large numbers are slower.
;; Other faster implementation uses some tricks to keep the number small longer.
