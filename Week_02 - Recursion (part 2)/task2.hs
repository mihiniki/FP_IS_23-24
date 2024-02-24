main :: IO()
main = do
    print $ sumDigitsRec 12345 == 15
    print $ sumDigitsRec 123 == 6
