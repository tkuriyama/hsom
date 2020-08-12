
--map f (map g xs) == map (f . g) xs

f xs = map (\x -> (x+1)/2) xs
f' = map ((/2) . (+1))
f'' = map (/2) . map (+1)
