import Euterpea
import Data.Ratio

f1 :: Int -> [Pitch] -> [Pitch]
f1 ap ps = map (trans ap) ps

f2 :: [Dur] -> [Music a]
f2 ds = map (\d -> Prim (Rest d)) ds

f3 :: [Music Pitch] -> [Music Pitch]
f3 ns = map f ns
  where f (Prim (Note d p)) = let d' = d * (1 % 2)
                              in Prim (Note d' p) :+: (rest d')
