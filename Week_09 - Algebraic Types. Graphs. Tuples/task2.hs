-- Description is readme.

main :: IO()
main = do
    print $ findJudge 2 [(1, 2)] == 2
    print $ findJudge 3 [(1, 3), (2, 3)] == 3
    print $ findJudge 3 [(1, 3), (2, 3), (3, 1)] == -1
    print $ findJudge 3 [(1, 2), (2, 3)] == -1
    print $ findJudge 4 [(1, 3), (1, 4), (2, 3), (2, 4), (4, 3)] == 3
  --  print $ everyBodyTrusts 3 [(1, 3), (2, 3), (3, 1)]

isLeaf :: Int -> [(Int, Int)] -> Bool
isLeaf x graph = null [p | (p, c) <- graph, p == x ]

everyBodyTrusts :: Int -> Int -> [(Int, Int)] -> Bool
everyBodyTrusts x n graph = n - 1 == length [p | (p, c) <- graph, c == x ]

findJudge :: Int -> [(Int, Int)] -> Int
findJudge n graph
 | null judges = -1 
 | otherwise = head judges
 where
    judges = filter (\ x -> everyBodyTrusts x n graph && isLeaf x graph) [1 .. n]