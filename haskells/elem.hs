elem' :: Eq a => a -> [a] -> Bool
_ `elem'` [] = False
e `elem'` (x:xs) 
	| (x == e) = True
	| otherwise = e `elem'` xs