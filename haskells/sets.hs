import qualified Data.Set as Set
import Test.HUnit

first = Set.fromList [1..4]
second = Set.fromList [3..6]

test_union = TestCase $ assertEqual "union" (Set.union first second) (Set.fromList [1..6])
test_difference = TestCase $ assertEqual "difference" (Set.difference first second) (Set.fromList [1,2])
test_difference2 = TestCase $ assertEqual "difference" (Set.difference second first) (Set.fromList [5,6])

main = runTestTT $ TestList [test_union, test_difference, test_difference2]