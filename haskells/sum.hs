import Test.HUnit

-- a use case for pattern matching in functions, avoid blowing up if list is emtpy
sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' x = head x + sum (tail x)

sumItems = TestCase $ assertEqual "test sum' with items" (sum' [1,2,3]) 6
sumempty = TestCase $ assertEqual "test sum' with empty list" (sum' []) 0

sumtests = TestList [TestLabel "sumempty" sumempty, TestLabel "sumItems" sumItems]