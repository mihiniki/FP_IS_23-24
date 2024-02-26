main :: IO()
main = do
    print $ isPrime 1 == False
    print $ isPrime 2 == True
    print $ isPrime 3 == True
    print $ isPrime 6 == False
    print $ isPrime 61 == True

isPrime :: Int -> Bool
isPrime 1 = False 
isPrime n = helper (n - 1)
 where
    helper 1 = True
    helper d = mod n d /= 0 && helper (d - 1)
