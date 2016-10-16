#lang sicp

; Instead of using square in their fast-prime?, the person in the question is
; using (* expr expr) where expr is just a copy of a complex recursive
; expression. So where using successive squaring / halving created a O(log n)
; process, that gain was undone by performing the work at each level twice.
