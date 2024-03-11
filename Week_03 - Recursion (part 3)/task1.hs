{-
A narcissistic number is a number which is the sum of its own digits,
each raised to the power of the number of digits. Define a
predicate that checks whether a given whole number is a narcissistic number.

**Acceptance criteria:**

1. All tests pass.
2. Only linearly recursive procedures are used.

Take 153 (3 digits):

1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153

and 1634 (4 digits):

1^4 + 6^4 + 3^4 + 4^4 = 1 + 1296 + 81 + 256 = 1634
-}

main :: IO()
main = do

    print $ isNarcissistic 7 == True
    print $ isNarcissistic 12 == False
    print $ isNarcissistic 370 == True
    print $ isNarcissistic 371 == True
    print $ isNarcissistic 1634 == True

countDigits :: Int -> Int
countDigits 0 = 0
countDigits n = 1 + countDigits (div n 10)

isNarcissistic :: Int -> Bool
isNarcissistic n = n == helper n
 where
    helper 0 = 0
    helper leftover = (mod leftover 10)^(countDigits n) + helper (div leftover 10)


