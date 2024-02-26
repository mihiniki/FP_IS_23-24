main :: IO()
main = do
    print $ isPerfect 0 == False
    print $ isPerfect 1 == False
    print $ isPerfect 6 == True -- 1 + 2 + 3 = 6 = 6
    print $ isPerfect 495 == False
    -- print $ isPerfect 33550336 == True

isPerfect :: Int -> Bool
isPerfect 0 = False 
isPerfect 1 = False
isPerfect n = n == sumDivs n

sumDivs :: Int -> Int
sumDivs n = helper (n - 1) 1
 where
    helper 0 _ = 0
    helper 1 res = res
    helper leftover res 
     | mod n leftover == 0 = helper (leftover - 1) (res + leftover)
     | otherwise = helper (leftover - 1) res

