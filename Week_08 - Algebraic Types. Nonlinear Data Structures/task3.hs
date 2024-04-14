{-
Define a new data type called `Shape`. `Shape` must have four constructors:

- `Circle`: with one argument representing the radius;
- `Rectangle`: with two arguments representing the width and height;
- `Triangle`;
- `Cylinder` with two arguments for the radius of the base and height.

Create a shape from every type and output it.

**Acceptance criteria:**

1. `Shape` is a `new` data type in Haskell.
2. Appropriate tests are added that demonstrate
    what the typeclass `Show` allows.
3. Appropriate tests are added that demonstrate
    what the typeclass `Eq` allows.
4. Appropriate tests are added that demonstrate
    what the typeclass `Read` allows.
5. Appropriate tests are added that demonstrate
    what the typeclass `Ord` allows.
-}
import Data.List
main :: IO()
main = do
    print $ Circle 5
    print $ Rectangle 5 10
    print $ Triangle 1 2 3
    print $ Triangle 1.42 2.55 6.66
    print $ f $ Circle 5
    print $ f2 "Circle 5"
    print $ f2 "Circle 5" == Circle 5
    print $ f2 "Circle 5" > Circle 10

data Shape a = Circle a | Rectangle a a | Triangle a a a | Cylinder a a
 deriving (Show, Read, Eq, Ord)

f :: (Num a) => Shape a -> a
f (Circle r) = r*40

f2 :: String -> Shape Int
f2 xs = read xs

