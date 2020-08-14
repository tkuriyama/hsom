import Euterpea

splitNote :: Music Pitch -> (Dur, Pitch)
splitNote (Prim (Note d p)) = (d, p)


retroPitches :: Music Pitch -> Music Pitch
retroPitches m = line $ zipWith (\d p -> note d p) ds ps
  where pairs = map splitNote $ lineToList m
        ds = map fst pairs
        ps = reverse $ map snd pairs

test = (retroPitches $ line [c 4 en, d 4 qn]) == (line [d 4 en, c 4 qn])

