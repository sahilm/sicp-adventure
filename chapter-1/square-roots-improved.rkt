#lang planet neil/sicp
; square roots via Newton's approximation with an improved good-enough?
; which measures deltas in guesses eliminiating one set of limited
; precision calculations

(define (square x)
  (* x x))

(define (good-enough? old-guess guess)
  (< (abs (- old-guess guess)) 0.000000000001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter old-guess guess x)
  (if (good-enough? old-guess guess)
      guess
      (sqrt-iter
       guess
       (improve guess x)
       x)))

(define (sqrt x)
  (sqrt-iter 0.0 1.0 x))
