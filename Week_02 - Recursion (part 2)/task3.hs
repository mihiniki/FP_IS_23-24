main :: IO()
main = do
    print $ powRec 2 5 == 32
    print $ powRec 15 3 == 3375

    print $ powIter 2 5 -- == 32
    print $ powIter 15 3 == 3375

    print $ powRec 2 0 -- should return an error (according to the task description)

powRec :: Int -> Int -> Int
powRec _ 0 = error "power cna't be zero"
powRec x 1 = x
powRec x n = x*powRec x (n - 1)

powIter :: Int -> Int -> Int
powIter x n = helper 1 n
 where
    helper res 1 = res*x
    helper res leftover = helper (res*x) (leftover - 1)
 