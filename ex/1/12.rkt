#lang sicp

; I have to implement Pascal's Triangle.
; I'm going to let the user specify a row and column in the triangle.
; The solution must be recursive, it does not have to be an iterative process.
;
;     1
;    1 1
;   1 2 1
;  1 3 3 1
; 1 4 6 4 1

(define (pascal row col)
  (if
    (or (= col 0) (= row col)) 1
    (+ (pascal (- row 1) (- col 1))
       (pascal (- row 1) col))))

(define (t? e a)
  (display (if (= e a) "✓" "✗"))
  (display (string-append " (= " (number->string e) " " (number->string a) ")\n")))

(t? 1 (pascal 0 0))

(t? 1 (pascal 1 0))
(t? 1 (pascal 1 1))

(t? 1 (pascal 2 0))
(t? 2 (pascal 2 1))
(t? 1 (pascal 2 2))

(t? 1 (pascal 3 0))
(t? 3 (pascal 3 1))
(t? 3 (pascal 3 2))
(t? 1 (pascal 3 3))
