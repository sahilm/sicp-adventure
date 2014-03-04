<h5>Exercise 1.5.  Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:</h5>

    (define (p) (p))

    (define (test x y)
      (if (= x 0)
          0
          y))

<h5>Then he evaluates the expression</h5>

    (test 0 (p))

<h5>What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer. (Assume that the evaluation rule for the special form if is the same whether the interpreter is using normal or applicative order: The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.)</h5>

In normal-order evaluation the program will never terminate because `(p)` never reduces. In applicative-order evaluation, the result will be 0.

In racket the above program never terminates.
