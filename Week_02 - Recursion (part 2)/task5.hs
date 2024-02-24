main :: IO()
main = do
    print $ sumDivs 0 == 0
    print $ sumDivs 1 == 1
    print $ sumDivs 6 == 12 -- 1 + 2 + 3 + 6
    print $ sumDivs 12345 == 19776
