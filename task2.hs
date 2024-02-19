main :: IO()
main = do

    print $ factRec 5 == 120
    print $ factRec 11 == 39916800
    --print $ factIter 5 == 120

factRec :: Int -> Int
factRec 1 = 1
factRec n = n * factRec (n - 1) 

-- factRec n
-- | n == 1 = 1
-- | otherwise = n * factRec (n - 1) 

factIter :: Int -> Int
factIter n = helper n 1
 where
    helper :: Int -> Int -> Int
    helper 1 res = 1
    helper n res = helper (n - 1) (res*n)

