
doubleEach = map (*2)

pairAndOne = map (\n -> (n, n+1))

addEachPair = map (\(a, b) -> a + b)

addPairsPointwise :: [(Int, Int)] -> (Int, Int)
addPairsPointwise = foldr (\(a, b) (accA, accB) -> (a + accA, b + accB)) (0, 0)
