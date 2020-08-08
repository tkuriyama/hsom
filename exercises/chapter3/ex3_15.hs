
decrypt :: [Int] -> String
decrypt = map (toEnum . (\n -> (n - 1) `mod` 255))

encrypt :: String -> [Int]
encrypt = map ((\n -> (n + 1) `mod` 255) . fromEnum)

s = "Hello world!"
test = s == (decrypt . encrypt $ s)
