import Euterpea

hNote :: Dur -> Pitch -> Music Pitch
hNote d p = note d p :=: note d (trans (-3) p)

hList :: Dur -> [Pitch] -> Music Pitch
hList d ps = line $ map (hNote d) ps

hList' :: Dur -> [Pitch] -> Music Pitch
hList' d = line . map (hNote d)

{- not recommended, hList with no LHS args
hList' d = line . map (hNote d)
         = (.) line (map (hNote d))
         = (.) line . (map . hNote)
-}
hList'' :: Dur -> [Pitch] -> Music Pitch
hList'' = (.) (line) . (map . hNote)

