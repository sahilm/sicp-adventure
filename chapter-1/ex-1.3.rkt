; Exercise 1.3.  Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.
#lang planet neil/sicp

(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (largest-number x y)
  (if (> x y) x y))

(define (sum-of-squares-of-largest-two-numbers x y z)
  (if (= x (largest-number x y)) (sum-of-squares x (largest-number y z))
      (sum-of-squares y (largest-number x z))))

(sum-of-squares-of-largest-two-numbers 5 -2 -3)
