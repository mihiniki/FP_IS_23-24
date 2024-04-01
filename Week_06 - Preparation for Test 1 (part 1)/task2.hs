{-
We say that one function dominates another if for
every value the absolute value after applying `f` is greater
than or equal to the absolute value after applying `g`.

Define a function that accepts two unary functions `f` and `g`
and a list of values and checks whether `f` dominates `g`.

**Acceptance criteria:**

1. All tests pass.
2. The task is solved on a single line of code.
3. The task is solved using **folding**.
-}

main :: IO()
main = do
    print $ dominates (\x -> x + 1) (\x -> x + 2) [1, 2, 3, 4, 5] == False
    print $ dominates (\x -> x * 3) (\x -> x + 2) [1, 2, 3, 4, 5] == True
    
    print $ dominatesFold (\x -> x + 1) (\x -> x + 2) [1, 2, 3, 4, 5] == False
    print $ dominatesFold (\x -> x * 3) (\x -> x + 2) [1, 2, 3, 4, 5] == True

dominates :: (Ord a) => (a -> a) -> (a -> a) -> [a] -> Bool
dominates f g xs = and $ map (\ x -> f x >= g x) xs

dominatesFold ::(Ord a) =>  (a -> a) -> (a -> a) -> [a] -> Bool
--dominatesFold f g xs = foldl (&&) True $ map (\ x -> f x >= g x) xs
dominatesFold f g xs = foldl (\ acc x -> acc && x) True $ map (\ x -> f x >= g x) xs




