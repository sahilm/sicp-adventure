<h5>Exercise 1.8.  Newton's method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value</h5>

    (x/y^2 + 2y) / 3

<h5>Use this formula to implement a cube-root procedure analogous to the square-root procedure. (In section 1.3.4 we will see how to implement Newton's method in general as an abstraction of these square-root and cube-root procedures.)</h5>


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
