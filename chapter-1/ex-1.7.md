<h5>Exercise 1.7. The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?</h5>

    #lang planet neil/sicp
    ; square roots via Newton's approximation

    (define (square x)
      (* x x))

    (define (good-enough? guess x)
      (< (abs (- (square guess) x)) 0.001))

    (define (average x y)
      (/ (+ x y) 2))

    (define (improve guess x)
      (average guess (/ x guess)))

    (define (sqrt-iter guess x)
      (if (good-enough? guess x) guess
          (sqrt-iter
           (improve guess x)
           x)))

    (define (sqrt x)
      (sqrt-iter 1.0 x))

    ; fails for small numbers when number is < 0.001 because good-enough? has limited precision
    ; expected = 0.02738612787
    ; actual = 0.03886213729674947
    (sqrt 0.00075)

    ; fractional part is incorrect because repeated averaging causes loss in digits due to limited precision
    ; expected = 111.110111104
    ; actual = 111.11011329928289
    (sqrt 12345.456789443234)

    (define (good-enough? old-guess guess)
      (< (abs (- old-guess guess)) 0.000000000001))

The good-enough? above improves precision for both large and small numbers.
