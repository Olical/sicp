#lang sicp

; Translating an equation into prefix notation.
;
; 5 + 4 + (2 - (3 - (6 + 4/5)))
; -----------------------------
;        3(6 - 2)(2 - 7)
;
; So there's one divide at the top level by the looks of things.
; (/ upper lower)
;
; The 4 over 5 can be written as (/ 4 5), I hope?
; The lower line is multiplication I think?

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))
