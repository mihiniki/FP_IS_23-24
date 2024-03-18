{-
Write functions that return the number of elements in a list.

**Acceptance criteria:**

1. All tests pass.
2. `myLengthRecNonPM` implements a linearly recursive process without pattern matching.
3. `myLengthRecPM` implements a linearly recursive process with pattern matching.
4. `myLengthFunc` uses built-in functions.
-}

main :: IO()
main = do
    print $ myLengthRecNonPM [] == 0
    print $ myLengthRecNonPM [1, 2, 3] == 3

    print $ myLengthRecPM [] == 0
    print $ myLengthRecPM [1, 2, 3] == 3

    print $ myLengthFunc [] == 0
    print $ myLengthFunc [1, 2, 3] == 3

myLengthRecNonPM :: [Int] -> Int
myLengthRecNonPM xs
 | null xs = 0
 | otherwise = 1 + myLengthRecNonPM (tail xs)

myLengthRecPM :: [Int] -> Int
myLengthRecPM [] = 0
myLengthRecPM (_:xs) = 1 + myLengthRecPM xs

myLengthFunc :: [Int] -> Int
myLengthFunc = length 
-- myLengthFunc xs = length xs

--xs = [1, 2, 3, 4]
--x = 1, xs = [2, 3, 4]
--myLengthRecPM (1:xs) = 1 + myLengthRecPM xs