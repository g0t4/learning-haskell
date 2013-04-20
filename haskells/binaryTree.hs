import Test.HUnit

data BinaryTree a = EmptyTree | Node a (BinaryTree a) (BinaryTree a) deriving (Show, Read, Eq)

singleton :: a -> BinaryTree a
singleton x = Node x EmptyTree EmptyTree

insert :: (Eq a, Ord a) => a -> BinaryTree a -> BinaryTree a
insert x EmptyTree = Node x EmptyTree EmptyTree
insert x original@(Node v l r)
	| x == v = original
	| x < v = Node v (insert x l) r
	| x > v = Node v l (insert x r)

testInsertIntoEmpty = (insert 5 EmptyTree) ~?= (singleton 5)
testInsertLessThan = (insert 5 (singleton 6)) ~?= (Node 6 (singleton 5) EmptyTree)
testInsertGreaterThan = (insert 7 (singleton 6)) ~?= (Node 6 EmptyTree (singleton 7))

insertTests = TestList [testInsertIntoEmpty, testInsertLessThan, testInsertGreaterThan]

treeElem :: (Eq a, Ord a) => a -> BinaryTree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node v l r) 
	| x == v = True
	| x < v = treeElem x l
	| x > v = treeElem x r

treeElem_elementIsRoot_True = (treeElem 5 $ singleton 5) ~?= True
treeElem_elementNotInTree_False = (treeElem 4 $ singleton 5) ~?= False
treeElem_elementInLeftTree_True = (treeElem 4 $ insert 4 $ singleton 5) ~?= True
treeElem_elementInRightTree_True = (treeElem 6 $ insert 6 $ singleton 5) ~?= True

treeElemTests = TestList [treeElem_elementIsRoot_True, treeElem_elementInRightTree_True, treeElem_elementInLeftTree_True, treeElem_elementNotInTree_False]

treeFromList :: (Eq a, Ord a) => [a] -> BinaryTree a
treeFromList [] = EmptyTree
treeFromList list = foldl (\tree c -> insert c tree) EmptyTree list

treeFromList_EmptyList_EmptyTree = (treeFromList ([]::[Int])) ~?= EmptyTree
treeFromList_NotEmptyList_CreatesTree = (treeFromList [2,1,3]) ~?= Node 2 (singleton 1) (singleton 3)

treeFromTests = TestList [treeFromList_EmptyList_EmptyTree, treeFromList_NotEmptyList_CreatesTree]

tests = TestList [insertTests, treeElemTests, treeFromTests]

main = runTestTT tests