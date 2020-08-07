
length' :: [a] -> Int
length' = foldr (\_ acc -> acc + 1) 0
