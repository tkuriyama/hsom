import Euterpea

x1 = (g 4 qn) :=: (c 4 en :+: d 4 en :+: e 4 en)
x2 = (g 4 qn) :=: tempo (3/2) (c 4 en :+: d 4 en :+: e 4 en)

phaseIt factor m = m :=: tempo factor m

phase1 = phaseIt 1.5 (times 4 (cut 4 m1))
phase2 = phaseIt 1.1 (times 4 (cut 4 m1))
phase3 = phaseIt 1.01 (times 4 (cut 4 m1))
  
-- ronde from ex3.14
pcs = [G, A, B, G, B, C, D, D, E, D, C, B, G, G, D, G]
os =  [4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4]
durs = [qn, qn, qn, qn, qn, qn, hn, den, sn, en, en, qn, qn, qn, qn, hn]

melody :: Music Pitch
melody = line $ map (\(d, p) -> note d p) $ zip durs $ zip pcs os

m1 = forever $ instrument RhodesPiano melody
m2 = forever . retro $ instrument Oboe melody



