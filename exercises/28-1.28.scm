;; Q: Implement the Miller-Rabin test. An unfoolable Fermat test.
;; If n is prime and a is any positive integer less than n, then a raised to the (n - 1)st power is congruent to 1 modulo n.
;; Pick a number a < n and raise a to the (n - 1)st power modulo n using expmod.
;; When we perform the squaring in expmod check to see if we have discovered a nontrivial square root of 1 modulo n.
;; Which is a number not equal to 1 or n - 1 whos square is equal to 1 modulo n.
;; If we find one of those, we know it's not prime.
;; Modify expmod to signal if it discovers a nontrivial square root. Use it to implement Miller-Rabin based on the Fermat test.
;; Maybe return 0 from expmod if it hits a nontrivial square root.
