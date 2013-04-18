import Data.Char
import Test.HUnit

quicksort :: Ord a => [a] -> [a]
quicksort []     = []
quicksort (p:xs) = (quicksort lesser) ++ [p] ++ (quicksort greater)
    where
        lesser  = filter (< p) xs
        greater = filter (>= p) xs
        
test1 = TestCase $ assertEqual "test sort" (quicksort [1, 5, 8, 3, 8, 6, 5, 3, 9]) [1, 3, 3, 5, 5, 6, 8, 8, 9]
test2 = TestCase $ assertEqual "test empty" (quicksort ([]::[Int])) ([]::[Int])

tests = TestList [TestLabel "test1" test1, TestLabel "test2" test2]