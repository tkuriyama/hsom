
power :: (Eq a, Num a) => (b -> b) -> a -> b -> b
power f n
  | n == 0 = f
  | otherwise = f . power f (n-1)
