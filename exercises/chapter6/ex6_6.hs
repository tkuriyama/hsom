import Euterpea
import Data.Ratio

data Ornament = NO           -- no ornament
              | MordentU      -- upper mordent
              | MordentL      -- lower mordent
              | Turn
              | TrillR         -- regular trill              

accent :: Dur -> [Int] -> Dur -> Pitch -> Music Pitch
accent s xs d p = (line $ accents) :+: (note d' p)
  where (num, denom) = (numerator s, denominator s)
        l = toInteger $ length xs
        d' = d * ((num * (denom - l)) % denom)
        accents = map (\x -> note (d*s) (trans x p)) xs

-- Mordents and Round

mordentU :: Dur -> Pitch -> Music Pitch
mordentU d p = accent (1%16) [0, 1] d p

mordentD :: Dur -> Pitch -> Music Pitch
mordentD d p = accent (1%16) [0, -1] d p

turn :: Dur -> Pitch -> Music Pitch
turn d p = accent (1%16) [1, 0, -1] d p

-- Trills

trillR :: Dur -> Pitch -> Music Pitch
trillR d p = accent (1%16) ts d p
  where ts = take 16 $ cycle [1, 0]
