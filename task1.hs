main :: IO()
main = do

    print $ minIf 15 60 == 15
    print $ minIf 60 15 == 15
    print $ minIf 1 (-1) == -1

    print $ minGuard 15 60 == 15
    print $ minGuard 60 15 == 15

    print $ minBuiltIn 60 15 == 15

    print $ lastDigit 154 == 4

    print $ quotientWhole 64 2 == 32

    print $ divWhole 154 17 == 9.058823529411764

    print $ removeLastDigit 154 == 15

    print $ divReal 154.451 10.01 == 15.42967032967033

    print $ quotientReal 154.21 17.17 == 8

    print $ avgWhole 5 1542 == 773.5

    print $ roundTwoDig 3.1413465345321 == 3.14

    print $ roundTwoDigButWithMagic 3.1413465345321 == 3.14

minIf :: Int -> Int -> Int
minIf x y = if x > y then y else x

minGuard :: Int -> Int -> Int
minGuard x y
 | y > x = x
 | otherwise = y

minBuiltIn :: Int -> Int -> Int
minBuiltIn x y = min x y 

lastDigit :: Int -> Int
lastDigit n = mod n 10
-- n `mod` 10

quotientWhole :: Int -> Int -> Int
quotientWhole x y = div x y

divWhole :: Int -> Int -> Double
divWhole x y = fromIntegral x / fromIntegral y

removeLastDigit :: Int -> Int
removeLastDigit x = div x 10

divReal :: Double -> Double -> Double
divReal x y = x / y

quotientReal :: Double -> Double -> Int
quotientReal x y = truncate $ x / y

avgWhole :: Int -> Int -> Double
avgWhole x y = (fromIntegral $ x + y)/2

roundTwoDig :: Double -> Double
roundTwoDig n = (fromIntegral $ round $ n*100)/100

--x + 5
--(+ 5)

--example :: Int -> Int
--example = (+ 5)

roundTwoDigButWithMagic :: Double -> Double
roundTwoDigButWithMagic = (/100) . fromIntegral . round . (*100)
-- (/100) $ fromIntegral $ round $ n*100


