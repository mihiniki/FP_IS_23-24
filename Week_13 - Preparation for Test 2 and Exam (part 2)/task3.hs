import Data.List

main :: IO()
main = do
    print $ mapLevel t1 [(*2), (*4), (`div` 100)] == Node 20 [Node 40 [Node 0 [Nil],Node 0 [Nil],Node 0 [Nil]],Node 40 [Node 0 [Nil],Node 0 [Nil],Node 0 [Nil]]]
    print $ mapLevel t1 [show, (nub . show . (* 1000))] == Node "10" [Node "10" [Nil,Nil,Nil],Node "10" [Nil,Nil,Nil]]
    print $ mapLevel t2 [(\ _ -> "r"), (\ char -> "w_" ++ [char]), (\ char -> "l_" ++ [char])] == Node "r" [Node "w_s" [Node "l_s" [Nil],Node "l_s" [Nil]]]

