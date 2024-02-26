main :: IO()
main = do
    print $ sumDivs 0 -- == 0
    print $ sumDivs 1 -- == 1
    print $ sumDivs 6 -- == 12 -- 1 + 2 + 3 + 6
    print $ sumDivs 12345 == 19776

sumDivs :: Int -> Int
sumDivs 0 = 0
sumDivs n = helper n 1
 where
    helper 0 _ = 0
    helper 1 res = res
    helper leftover res 
     | mod n leftover == 0 = helper (leftover - 1) (res + leftover)
     | otherwise = helper (leftover - 1) res