module Utils where
import Euterpea
import Data.Ratio

accent :: Dur -> [Int] -> Dur -> Pitch -> Music Pitch
accent s xs d p = (line $ accents) :+: (note d' p)
  where (num, denom) = (numerator s, denominator s)
        d' = d * ((denom - (toInteger (length xs))) % denom)
        accents = map (\x -> note s (trans x p)) xs

-- Mordents and Round

mordentU :: Dur -> Pitch -> Music Pitch
mordentU d p = accent (1%16) [0, 1] d p

mordentD :: Dur -> Pitch -> Music Pitch
mordentD d p = accent (1%16) [0, -1] d p

turn :: Dur -> Pitch -> Music Pitch
turn d p = accent (1%16) [1, 0, -1] d p
