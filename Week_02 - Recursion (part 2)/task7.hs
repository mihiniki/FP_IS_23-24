main :: IO()
main = do
    print $ hasIncDigits 1244 == True
    print $ hasIncDigits 12443 == False
    
