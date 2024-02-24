main :: IO()
main = do
    print $ powRec 2 5 == 32
    print $ powRec 15 3 == 3375

    print $ powIter 2 5 == 32
    print $ powIter 15 3 == 3375

    --print $ powRec 2 0 == 1 -- should return an error (according to the task description)
 