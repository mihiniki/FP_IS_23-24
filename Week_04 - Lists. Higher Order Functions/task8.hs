{-
Define functions that:

- Reverse a number;
- Calculate the factorial of a number;
- Check whether a number is prime;
- Returns the sum of the digits of a number;
- Find the sum of the divisors of a number.

**Acceptance criteria:**

1. All tests pass.
2. Every definition is done on a single line.
-}

import Data.Char

main :: IO()
main = do
    print $ rev 123 == 321

    print $ fact 5 == 120

    print $ isPrime 1 == False
    print $ isPrime 2 == True
    print $ isPrime 5 == True
    print $ isPrime 6 == False
    print $ isPrime 11 == True
    print $ isPrime 13 == True

    print $ sumDig 142500 == 12

    print $ sumDivs 161 == 192


rev :: Int -> Int
rev = read . reverse . show
-- rev x = read $ reverse $ show x 

fact :: Int -> Int
fact x = product [1 .. x]

isPrime :: Int -> Bool
isPrime x = x > 1 && null [n | n <- [2 .. x -1], mod x n == 0]

sumDig :: Int -> Int
sumDig n = sum $ map (\ x -> digitToInt x) $ show n

sumDivs :: Int -> Int
sumDivs n = sum $ filter (\ x -> mod n x == 0) [1 .. n]