main :: IO()
main = do
    print $ numOfNodes t1 == 2 -- 8 and 12
    print $ numOfNodes t2 == 3 -- 5, 8 and 12

data NTree = Nil | Node Int [NTree]

t1 = Node 10 [Node 3 [Node 5 [Nil], Node 8 [Node 1 [Nil], Node 2 [Nil]], Node 9 [Nil]], Node 7 [Node 11 [Nil], Node 13 [Nil]], Node 12 [Node 6 [Nil], Node 4 [Nil]]]
t2 = Node 10 [Node 3 [Node 5 [Node 1 [Nil], Node 2 [Nil]], Node 8 [Node 1 [Nil], Node 2 [Nil]], Node 9 [Nil]], Node 7 [Node 11 [Nil], Node 13 [Nil]], Node 12 [Node 6 [Nil], Node 4 [Nil]]]

numOfNodes :: NTree -> Int
numOfNodes Nil = 0
numOfNodes (Node value children) = (sum $ map numOfNodes children) + (length $ filter (\ child -> (sum $ getLevel child 1) == value) children)

getLevel :: NTree -> Int -> [Int]
getLevel Nil _ = []
getLevel (Node value _) 0 = [value]
getLevel (Node _ children) k = concatMap (\ child -> getLevel child (k - 1)) children