{-
Define a predicate that accepts two non-negative
inputs - `x` and `y` and checks
whether `x` is a sub-number of `y`.

**Acceptance criteria:**

1. All tests pass.
-}

main :: IO()
main = do
    print $ subNum 123 5123783 == True -- x = 123, y = 5123783
    print $ subNum 0 0 == True
    print $ subNum 10 101 == True
    print $ subNum 101 101 == True
    print $ subNum 10 0 == False
    print $ subNum 1253 5123783 == False
    print $ subNum 12 0 == False

countDigits :: Int -> Int
countDigits 0 = 0
countDigits n = 1 + countDigits (div n 10)

subNum :: Int -> Int -> Bool
subNum x y 
 | y < x = False
 | mod y (10^countDigits x) == x = True
 | otherwise = subNum x (div y 10)



 