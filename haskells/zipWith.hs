zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' m as bs = [ m a b | (a, b) <- zip as bs]
