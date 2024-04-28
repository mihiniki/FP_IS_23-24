{-
​​size - returns the number of nodes;
sumTree - returns the sum of the nodes (should work only for trees that store numbers in their nodes);​
traverseDFS​ - prints the nodes using DFS;
getLevel - accepts a whole number k and returns the nodes at level k (root is at level 0);
traverseBFS - prints the nodes using BFS;
mapTree - maps an unary function to the tree.

**Acceptance criteria:**

1. All tests pass.
-}
import Data.Char
main :: IO()
main = do
    print $ numberBTree
    print $ charBTree

    print $ size numberBTree == 9
    print $ size charBTree == 7

    print $ sumTree numberBTree == 146
    -- print $ sumTree charBTree -- should not work

    print $ traverseDFS numberBTree == [96, 1, 12, 0, 5, 2, 4, 5, 21]
    print $ traverseDFS charBTree == "haskell"

    print $ getLevel numberBTree 2 == [1, 0, 2, 5]
    print $ getLevel charBTree 1 == "al"
    print $ getLevel charBTree 3 == []

    print $ traverseBFS numberBTree -- == [5,12,4,1,0,2,5,96,21]
    print $ traverseBFS charBTree -- == "kalhsel"

    print $ mapTree numberBTree (*2) == Node 10 (Node 24 (Node 2 (Node 192 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 8 (Node 4 Nil Nil) (Node 10 Nil (Node 42 Nil Nil)))
    print $ mapTree numberBTree (show) == Node "5" (Node "12" (Node "1" (Node "96" Nil Nil) Nil) (Node "0" Nil Nil)) (Node "4" (Node "2" Nil Nil) (Node "5" Nil (Node "21" Nil Nil)))
    print $ mapTree charBTree (toUpper) == Node 'K' (Node 'A' (Node 'H' Nil Nil) (Node 'S' Nil Nil)) (Node 'L' (Node 'E' Nil Nil) (Node 'L' Nil Nil))

data BTree a = Nil | Node a (BTree a) (BTree a)
 deriving (Show, Eq)

size :: (Num b) => BTree a -> b 
size Nil = 0
size (Node _ left right) = 1 + size left + size right 

sumTree :: BTree Int -> Int
sumTree Nil = 0
sumTree (Node value left right) = value + sumTree left + sumTree right

traverseDFS :: BTree a -> [a]
traverseDFS Nil = []
traverseDFS (Node value left right) = traverseDFS left ++ [value] ++ traverseDFS right

getLevel :: BTree a -> Int -> [a]
getLevel Nil _ = []
getLevel (Node value left right) 0 = [value]
getLevel (Node value left right) level = getLevel left (level - 1) ++ getLevel right (level - 1)

--traverseBFS :: BTree a -> [a]
traverseBFS tree = concat $ takeWhile (\ xs -> xs /= []) $ map (\ level -> getLevel tree level) [0 .. ]

numberBTree :: BTree Int
numberBTree = (Node 5 (Node 12 (Node 1 (Node 96 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 4 (Node 2 Nil Nil) (Node 5 Nil (Node 21 Nil Nil))))

charBTree :: BTree Char
charBTree = (Node 'k' (Node 'a' (Node 'h' Nil Nil) (Node 's' Nil Nil)) (Node 'l' (Node 'e' Nil Nil) (Node 'l' Nil Nil)))

mapTree :: BTree a -> (a -> b) -> BTree b
mapTree Nil _ = Nil
mapTree (Node value left right) f = (Node (f value) (mapTree left f) (mapTree right f))