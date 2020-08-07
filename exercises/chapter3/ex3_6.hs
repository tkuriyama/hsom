{-

While foldlr is normally more efficent, the effect of flip is such that foldl is now more efficient. 

Worked example with [[1], [2], [3]]...

foldl (flip (++)) []
Flip reverses \acc v to v acc
flip (++) [3] (flip (++) [2] (++) [1] []))

foldr (flip (++)) []
flip reverses \v acc tp acc v
flip (++) (flip (++) (flip (++) [] [1]) [2]) [3]


Timed in GHCI:

Prelude> length $ foldl (++) [] [[x] | x <- [1..10000]]
length $ foldl (++) [] [[x] | x <- [1..10000]]
10000
it :: Int
(1.02 secs, 4,295,141,488 bytes)

Prelude> length $ foldr (++) [] [[x] | x <- [1..10000]]
length $ foldr (++) [] [[x] | x <- [1..10000]]
10000
it :: Int
(0.01 secs, 2,630,984 bytes)
Prelude> length $ foldl (flip (++)) [] [[x] | x <- [1..10000]]
length $ foldl (flip (++)) [] [[x] | x <- [1..10000]]
10000
it :: Int
(0.01 secs, 2,711,024 bytes)

Prelude> length $ foldr (flip (++)) [] [[x] | x <- [1..10000]]
length $ foldr (flip (++)) [] [[x] | x <- [1..10000]]
10000
it :: Int
(1.04 secs, 4,295,061,576 bytes)

-}
