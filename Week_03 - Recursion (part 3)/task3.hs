{-
Write a function that finds the maximum digit in a number.

**Acceptance criteria:**

1. All tests pass.
-}

main :: IO()
main = do
    print $ findMax 55345 == 5
    print $ findMax 14752 == 7
    print $ findMax 329450 == 9
    print $ findMax 9521 == 9

findMax :: Int -> Int
findMax n = helper (div n 10) (mod n 10)
 where
    helper 0 res = res
    helper n res 
     | mod n 10 >= res = helper (div n 10) (mod n 10)
     | otherwise = helper (div n 10) res

