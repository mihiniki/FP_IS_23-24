{-
Given a list of unique whole numbers construct a *maximum binary tree*. A binary tree is a *maximum binary tree* if:

- The root is the maximum number in the list.
- The left subtree is the maximum tree constructed from the elements on the left of the of the maximum number.
- The right subtree is the maximum tree constructed from the elements on the right of the maximum number.

**Acceptance criteria:**

1. All tests pass.

t:
    6
  /   \
 3     5
 \     /
  2   0
   \
    1
-}

main :: IO()
main = do
    print $ constructMaxBTree [3, 2, 1, 6, 0, 5] == t

t :: BTree Int
t = Node 6 (Node 3 Nil (Node 2 Nil (Node 1 Nil Nil))) (Node 5 (Node 0 Nil Nil) Nil)

data BTree a = Nil | Node a (BTree a) (BTree a)
 deriving (Show, Eq, Ord)

constructMaxBTree :: (Ord a) => [a] -> BTree a
constructMaxBTree [] = Nil
constructMaxBTree xs = Node maxEl (constructMaxBTree leftXs) (constructMaxBTree rightXs)
 where
    maxEl = maximum xs
    leftXs = takeWhile (/=maxEl) xs
    rightXs = tail $ dropWhile (/=maxEl) xs