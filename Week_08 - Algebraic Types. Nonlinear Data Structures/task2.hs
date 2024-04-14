{-
Define a function that checks whether a given path is valid in
a graph `g = (1, [2, 3]), (2, [3, 4]), (3, []), (4, [])`.

**Acceptance criteria:**

1. All tests pass.
-}

main :: IO()
main = do
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [1, 2, 4] == True
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [1, 3, 4] == False
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [2, 3] == True
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [3, 1] == False


type Node = Int
type Graph = [(Node, [Node])]

isChild :: (Node, Node) -> Graph -> Bool
isChild (parent, child) g = any (\ (p, children) -> parent == p && elem child children) g

isPath :: Graph -> [Node] -> Bool
isPath g path = all (\ (parent, child) -> isChild (parent, child) g ) $ zip path (tail path)

