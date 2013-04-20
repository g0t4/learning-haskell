data Test = Test {name :: String} deriving (Show)

test = Test "wes"

main = print $ name test