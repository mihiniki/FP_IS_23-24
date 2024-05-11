main :: IO()
main = do
    print $ grandchildrenIncreased t1 == False
    print $ grandchildrenIncreased t2 == True
    print $ getLevel t2 2 

data BTree = Empty | Node Int BTree BTree

t1 = Node 8 (Node 3 (Node 1 Empty Empty) (Node 4 Empty Empty)) (Node 10 (Node 9 Empty Empty) (Node 14 Empty Empty))
t2 = Node 8 (Node 3 (Node 9 Empty Empty) (Node 10 Empty Empty)) (Node 10 (Node 11 Empty Empty) (Node 14 Empty Empty))

grandchildrenIncreased :: BTree -> Bool
grandchildrenIncreased Empty = True
grandchildrenIncreased root@(Node value left right) = all (\ elem -> elem > value) (getLevel root 2) && 
                                                        (grandchildrenIncreased left) && (grandchildrenIncreased right)

getLevel :: BTree -> Int -> [Int]
getLevel Empty _ = []
getLevel (Node value left right) 0 = [value]
getLevel (Node value left right) k = getLevel left (k - 1) ++ getLevel right (k - 1)