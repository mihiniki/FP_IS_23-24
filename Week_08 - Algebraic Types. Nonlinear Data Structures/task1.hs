{-
Given a directed graph *g* with edges `[(1, 2), (1, 3), (2, 3), (2, 4)]`
define the following functions:

1. nodes - returns all the nodes of "g";
2. neighbors - accepts a node and returns its neighbors;
3. adjacencyList - returns the children of every parent.

**Acceptance criteria:**

1. All tests pass.
2. Appropriate types are created for the graph structure.
-}
import Data.List
main :: IO()
main = do
    print $ nodes [(1, 2), (1, 3), (2, 3), (2, 4)] == [1, 2, 3, 4]

    print $ neighbors 2 [(1, 2), (1, 3), (2, 3), (2, 4)] -- == [3, 4]
    print $ neighbors 4 [(1, 2), (1, 3), (2, 3), (2, 4)] == []

    print $ adjacencyList [(1, 2), (1, 3), (2, 3), (2, 4)] -- == [(1, [2, 3]), (2, [3, 4])]

type Graph = [Edge]
type Edge = (Node, Node)
type Node = Int

nodes :: Graph -> [Node]
nodes g = nub $ concat [[parent, children] | (parent, children) <- g]

neighbors :: Node -> Graph -> [Node]
neighbors node g = nub $ [ child | (parent, child) <- g, parent == node] ++ [parent | (parent, child) <- g, child == node]

children :: Node -> Graph -> [Node]
children node g = [child | (parent, child) <- g, parent == node]

adjacencyList :: Graph -> [(Node, [Node])]
adjacencyList g = [ (x, children x g) | x <- nodes g, not $ null $ children x g]