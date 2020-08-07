
applyEach :: [a -> b] -> a -> [b]
applyEach fs v = map (\f -> f v) fs
