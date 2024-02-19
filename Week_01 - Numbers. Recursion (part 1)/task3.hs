main :: IO()
main = do

    print $ fibRec 11 == 89
    print $ fibIter 11 -- == 89
   -- print $ fibIter 110 == 43566776258854844738105

fibRec :: Int -> Int
fibRec 0 = 0
fibRec 1 = 1
fibRec n = fibRec (n - 1) + fibRec (n - 2)

fibIter :: Integer -> Integer
fibIter n = helper n 0 1
 where
    helper 0 n0 _ = n0
    helper 1 _ n1 = n1
    helper leftover n0 n1 = helper (leftover - 1) n1 (n0 + n1)

-- helper n 0 1
-- helper (n - 1) 1 1
-- helper (n - 2) 1 2
-- helper (n - 3) 2 3
-- helper (n - 4) 3 5