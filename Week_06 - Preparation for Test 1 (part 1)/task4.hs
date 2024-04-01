-- refer to readme

import Data.List

main :: IO()
main = do

    print $ partition even [1 .. 10]

    print $ splitPoints (1, 1) 5 [(1, 2), (2, 3), (10, 15), (-1, 1), (12, 14)] == ([(1.0, 2.0), (2.0, 3.0), (-1.0, 1.0)], [(10.0, 15.0), (12.0, 14.0)])
    print $ splitPoints (10, 10) 5 [(1, 2), (2, 3), (10, 15), (-1, 1), (12, 14)] == ([(10.0, 15.0), (12.0, 14.0)], [(1.0, 2.0), (2.0, 3.0), (-1.0, 1.0)])
    print $ splitPoints (0, 0) 2 [(0, 0), (1, 1), (2, 2), (0, 2)] == ([(0.0,0.0),(1.0,1.0),(0.0,2.0)],[(2.0,2.0)])
    print $ splitPoints (0, 0) (-1) [(0, 0), (1, 1), (2, 2), (0, 2)] -- Should give an error

type Point = (Double, Double)

isIn :: Point -> Double -> Point -> Bool
isIn (x, y) r (x1, y1) = (x1 - x)^2 + (y - y1)^2 <= r^2

splitPoints :: Point -> Double -> [Point] -> ([Point], [Point])
splitPoints center r ps 
 | r < 0 = error "Radius must be positive"
 | otherwise = partition (\ point -> isIn center r point) ps
