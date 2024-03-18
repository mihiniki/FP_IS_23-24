{-
Write a function that generates a list with the numbers in the interval `[x, y]`.

**Acceptance criteria:**

1. All tests pass.
2. `getClosedIntervalRec` is defined using recursion.
3. `getClosedIntervalOneLine` is defined on a single line.
-}

main :: IO()
main = do
    print $ getClosedIntervalRec 1 9 == [1, 2, 3, 4, 5, 6, 7, 8, 9]
    print $ getClosedIntervalRec 9 1 == [1, 2, 3, 4, 5, 6, 7, 8, 9]

    print $ getClosedIntervalOneLine 1 9 -- == [1, 2, 3, 4, 5, 6, 7, 8, 9]
    print $ getClosedIntervalOneLine 9 1 -- == [1, 2, 3, 4, 5, 6, 7, 8, 9]

getClosedIntervalRec :: Int -> Int -> [Int]
getClosedIntervalRec x y = helper (min x y) (max x y)
 where
    helper start finish
     | start > finish = []
     | otherwise = start : helper (start + 1) finish

getClosedIntervalOneLine :: Int -> Int -> [Int]
getClosedIntervalOneLine x y = [min x y .. max x y] 

--[1 .. 4] -> [1, 2, 3, 4]
--[1, 3, .. 8] -> [1, 3, 5, 7]