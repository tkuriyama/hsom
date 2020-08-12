
f xs = map (\x -> (x+1)/2) xs

f' = map ((/2) . (+1))

