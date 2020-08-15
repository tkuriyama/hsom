import Euterpea

-- ronde from ex3.14
pcs = [G, A, B, G, B, C, D, D, E, D, C, B, G, G, D, G]
os =  [4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4]
durs = [qn, qn, qn, qn, qn, qn, hn, den, sn, en, en, qn, qn, qn, qn, hn]

melody :: Music Pitch
melody = line $ map (\(d, p) -> note d p) $ zip durs $ zip pcs os

m1 = forever $ instrument RhodesPiano melody
m2 = forever . retro $ instrument Oboe melody
m3 = (:+:) (rest 2) $ forever . retro $ instrument AcousticGrandPiano melody
piece = cut 8 $ m1 /=: m2 /=: m3

