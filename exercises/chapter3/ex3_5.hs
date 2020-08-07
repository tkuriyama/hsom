

applyAll fs v = foldr (\f acc -> f acc) v fs

simple x y z = x * (y + z)
test = applyAll [simple 2 2, (+ 3)] 5 == 20
