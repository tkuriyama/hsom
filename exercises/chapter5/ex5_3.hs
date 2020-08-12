
fix :: (b -> b) -> b
fix f = f (fix f)

remainder :: Integer -> Integer -> Integer
remainder a b = if a < b then a
                else remainder (a - b) b

remainder' :: Integer -> Integer -> Integer
remainder' a b = fix (\f a b -> if a < b then a else f (a - b) b) a b
