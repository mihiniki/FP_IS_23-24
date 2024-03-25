{-
Define the `Rat` data type that is
the tuple `(x, y)` where `x` is
the numerator and `y` - the denominator of a rational number.
Define a function called `normalize` which will simplify the
numerator and denominator (so that their
highest common denominator is `1`).

**Acceptance criteria:**

1. All tests pass.
2. Polymorphic typeclasses are used.
-}

main :: IO()
main = do
    print $ normalize (4, 2) == (2, 1)
    print $ normalize (8, 4) == (2, 1)
    print $ normalize (2, 4) == (1, 2)

    print $ normalizeUsingLet (4, 2) == (2, 1)
    print $ normalizeUsingLet (8, 4) == (2, 1)
    print $ normalizeUsingLet (2, 4) == (1, 2)

type Rat a = (a, a)

normalizeUsingLet :: (Integral a) => Rat a -> Rat a
normalizeUsingLet (x, y) = let t = gcd x y in (div z t, div y t)

normalize :: (Integral a) => Rat a -> Rat a
normalize (x, y) = (div x t, div y t)
 where
    t = gcd x y

