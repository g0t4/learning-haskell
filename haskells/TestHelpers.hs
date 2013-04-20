module TestHelpers (isEqualTo) where

import Test.HUnit

isEqualTo :: (Eq a, Show a) => a -> a -> Test
isEqualTo a b = TestCase $ assertEqual "" a b