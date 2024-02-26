main :: IO()
main = do
    print $ hasIncDigits 1244 == True
    print $ hasIncDigits 12443 == False

hasIncDigits :: Int -> Bool
hasIncDigits n = n < 10 || mod n 10 >= mod (div n 10) 10 && hasIncDigits (div n 10)

