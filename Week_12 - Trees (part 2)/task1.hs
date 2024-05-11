main :: IO()
main = do
    -- print $ t
    print $ size t == 13
    print $ getLevel t 2 == [5, 8, 9, 11, 13, 6, 4]

data NTree a = Nil | Node a [NTree a]
 deriving (Show)

t = Node 10 [Node 3 [Node 5 [Nil], Node 8 [Node 1 [Nil], Node 2 [Nil]], Node 9 [Nil]], Node 7 [Node 11 [Nil], Node 13 [Nil]], Node 12 [Node 6 [Nil], Node 4 [Nil]]]

size :: (Num a) => NTree a -> Int
size Nil = 0
size (Node _ children) = 1 + (sum $ map (\ child -> size child) children)

getLevel :: NTree a -> Int -> [a]
getLevel Nil _ = []
getLevel (Node value _) 0 = [value]
getLevel (Node _ children) k = concatMap (\ child -> getLevel child (k - 1)) children