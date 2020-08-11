-- JS Bach, Twelve Preludes, C Major, BWV 924
import Euterpea

type Triple = (AbsPitch, AbsPitch, AbsPitch)

t35  = (0, 3, 5)
t38  = (0, 3, 8)
t45  = (0, 4, 5)
t49  = (0, 4, 9)
t56  = (0, 5, 6)
t57  = (0, 5, 7)
t58  = (0, 5, 8)
t59  = (0, 5, 9)
t510 = (0, 5, 10)
t79  = (0, 7, 9)
t710 = (0, 7, 10)

-- A melody phrase (one rest and a triple) in first half of the piece
tPhrase :: Pitch -> Triple -> Music Pitch
tPhrase p (t1, t2, t3) = rest sn :+: triple
  where triple = line $ map (note sn) [trans t1 p, trans t2 p, trans t3 p]

-- melody bars
genMLine = line . map (uncurry tPhrase)

g4 = (G, 4)
a4 = (A, 4)

m1 = genMLine [(g4, t59), (g4, t59), (g4, t57), ((B,4), t38)]
m2 = genMLine [(a4, t510), (a4, t58), (a4, t57), ((C,5), t49)]
m3 = genMLine [((B,4), t510), ((B,4), t58), ((C,5), t45), (g4, t710)]
m4 = genMLine [(g4, t79), (g4, t59), (a4, t35), ((E,4), t710)]

melody :: Music Pitch
melody = line [m1, m2, m3, m4]

-- bass bars

bass = line [m1, m2, m3, m4]

-- putting it to together...

piece :: Music Pitch
piece = let t = 50 / 120
        in tempo t (melody :=: bass)

