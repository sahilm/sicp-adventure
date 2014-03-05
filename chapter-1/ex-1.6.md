<h5>Exercise 1.6.  Alyssa P. Hacker doesn't see why if needs to be provided as a special form. ``Why can't I just define it as an ordinary procedure in terms of cond?'' she asks. Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:</h5>

    (define (new-if predicate then-clause else-clause)
      (cond (predicate then-clause)
            (else else-clause)))

<h5>Eva demonstrates the program for Alyssa:</h5>

    (new-if (= 2 3) 0 5)
    5

    (new-if (= 1 1) 0 5)
    0

<h5>Delighted, Alyssa uses new-if to rewrite the square-root program:</h5>

    (define (sqrt-iter guess x)
      (new-if (good-enough? guess x)
              guess
              (sqrt-iter (improve guess x)
                         x)))

<h5>What happens when Alyssa attempts to use this to compute square roots? Explain.</h5>

The program will never terminate because `new-if` will evaluate `sqrt-iter` ad infinitum.
