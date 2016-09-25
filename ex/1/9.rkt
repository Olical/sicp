#lang sicp

; Given these two procedures:

(define (+ a b)
  (if (= a 0)
    b
    (inc (+ (dec a) b))))

(define (+ a b)
  (if (= a 0)
    b
    (+ (dec a) (inc b))))

; I have to use the substitution model to evaluate them. Are they iterative or
; recursive? We want it to be recursive at the language level, but iterative at
; the process level. If it's recursive at the process level then it will expand
; the full stack then shrink it back down, using linear memory.
;
; If it's as described, it will be efficient in the CPU but elegant in the language.
;
; So, how does (+ 4 5) behave with both?

; First:
; So at an initial glance this looks recursive, simply because the call to +
; isn't in the tail position. To call the else path you need this stack frame
; as well as the next one, it's not clean. If it were in the tail position then
; you can evaluate everything in that stack frame before passing the
; information onto the next step. It's essentially accidentally holding onto
; resources, like a memory leak.
;
; Time for some proof.

(inc (+ (dec 4) 5))
     (inc (+ (dec 3) 5))
          (inc (+ (dec 2) 5))
               (inc (+ (dec 1) 5))
                    5
               6
          7
     8
9

; Second:
; It is clearly recursive to me, since I can compute this by hand in a more
; linear fashion. It reads recursively, but executes linearly.

(+ (dec 4) (inc 5))
(+ (dec 3) (inc 6))
(+ (dec 2) (inc 7))
(+ (dec 1) (inc 8))
(+ (dec 0) (inc 9))
9

; Much easier to do by hand and linear :D
; Not exactly the substitution method, but, meh, I don't care, I learned what I needed to.
