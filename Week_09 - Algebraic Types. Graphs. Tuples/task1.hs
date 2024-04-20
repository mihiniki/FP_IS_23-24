{-
Define a new **polymorphic** algrebraic data type
called `Point`. A point may have two
or three dimensions.
Create an instance for every dimension and print it.

**Acceptance criteria:**

1. `Point` is a `new` data type in Haskell.
2. Appropriate tests are added.
-}

main :: IO()
main = do
    print $ "Hello, world!"
    print $ ThreeD 5 6 8 <= ThreeD 5 6 8

data Point a = TwoD a a | ThreeD a a a 
 deriving (Show, Eq, Ord)