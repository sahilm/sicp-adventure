#lang planet neil/sicp
; cube roots via Newton's approximation with an improved good-enough?
; which measures deltas in guesses eliminiating one set of limited
; precision calculations

(define (square x)
  (* x x))

(define (good-enough? old-guess guess)
  (< (abs (- old-guess guess)) 0.000000000001))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (+ guess guess))
     3))

(define (cube-root-iter old-guess guess x)
  (if (good-enough? old-guess guess)
      guess
      (cube-root-iter
       guess
       (improve guess x)
       x)))

(define (cube-root x)
  (cube-root-iter 0.0 1.0 x))