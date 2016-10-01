#lang sicp

; Given the count-change definition.
(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

; Draw the tree for the process for 11 cents.
; What are the orders of growth of space and steps for this.
;
; So, the tree first. I guess I'll sort of do it in pseudo lisp.

(count-change 11
  (cc 11 5
    (cc 11 4
      (cc 11 3
        (cc 11 2
          (cc 11 1
            (cc 11 0
              0)
            (cc 10 1
              (cc 10 0
                0)
              (cc 9 1
                (cc 9 0
                  0)
                (cc 8 1
                  (cc 8 0
                    0)
                  (cc 7 1
                    (cc 7 0
                      0)
                    (cc 6 1
                      (cc 6 0
                        0)
                      (cc 5 1
                        (cc 5 0
                          0)
                        (cc 4 1
                          (cc 4 0
                            0)
                          (cc 3 1
                            (cc 3 0
                              0)
                            (cc 2 1
                              (cc 2 0
                                0)
                              (cc 1 1
                                (cc 1 0
                                  0)
                                (cc 0 1
                                  1)))))))))) ; HIT
          (cc 6 2
            (cc 6 1
              (cc 6 0
                0)
              (cc 5 1
                (cc 5 0
                  0)
                (cc 4 1
                  (cc 4 0
                    0)
                  (cc 3 1
                    (cc 3 0
                      0)
                    (cc 2 1
                      (cc 2 0
                        0)
                      (cc 1 1
                        (cc 1 0
                          0)
                        (cc 0 1
                          1))))))) ; HIT
            (cc 1 2
              (cc 1 1
                (cc 1 0
                  0)
                (cc 0 1
                  1)) ; HIT
              (cc -4 2
                0))))
        (cc 1 3
          (cc 1 2
            (cc 1 1
              (cc 1 0
                0)
              (cc 0 1
                1)) ; HIT
            (cc -4 2
              0))
          (cc -9 3
            0)))
      (cc -14 4
        0))
    (cc -39 5
      0)))

; So there are four hits.
; Now for the running time and resources.
; Space is O(n) because the space is proportional to the depth and the depth is proportional to the amount.
; The steps are proportional to the number of coins used and n. I couldn't prove this, I'm not sure how, but I found other explanations of it online.
; Yes it's cheating, but I'd rather have a go at these exercises and have someone explain the more mathy parts to me than skip them entirely.
; So steps is O(n^5) where there are five coin types.
