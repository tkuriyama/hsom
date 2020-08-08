import Euterpea

pcs = [G, A, B, G, B, C, D, D, E, D, C, B, G, G, D, G]
os =  [4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4]
durs = [qn, qn, qn, qn, qn, qn, hn, den, sn, en, en, qn, qn, qn, qn, hn]

melody :: Int -> Music Pitch
melody n = line $ concat . take n . repeat $
           map (\(d, p) -> note d p) $ zip durs $ zip pcs os

mkRest :: Int -> Dur -> Music Pitch
mkRest n d = line $ take n $ repeat (rest d)

ronde :: Music Pitch
ronde = (melody 3) :=:
        mkRest 2 qn :+: instrument RhodesPiano (melody 3) :=:
        mkRest 4 qn :+: instrument Oboe (melody 3) :=:
        mkRest 8 qn :+: instrument Harmonica (melody 3)
