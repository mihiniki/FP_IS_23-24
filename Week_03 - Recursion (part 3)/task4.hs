{-
Define a function `sumNumbers start finish` that
returns the sum of all numbers in the interval `[start, finish]`
whose digits are ordered in descending order.

**Acceptance criteria:**

1. All tests pass.
2. Implement a linearly recursive process.
-}

main :: IO()
main = do
    print $ sumNumbers 1 9 == 45
    print $ sumNumbers 199 203 == 200
    print $ sumNumbers 219 225 == 663
    print $ sumNumbers 225 219 == 663

isDescending :: Int -> Bool
isDescending n
 | n < 10 = True
 | mod n 10 <= mod (div n 10) 10 = True && isDescending (div n 10)
 | otherwise = False 

sumNumbers :: Int -> Int -> Int
sumNumbers start finish = helper (min start finish) (max start finish)
 where
    helper s f
     | s > f = 0
     | isDescending s = s + helper (s + 1) f
     | otherwise = helper (s + 1) f