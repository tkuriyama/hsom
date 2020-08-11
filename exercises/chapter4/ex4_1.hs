-- JS Bach, Twelve Preludes, C Major, BWV 924
import Euterpea

type Triple = (AbsPitch, AbsPitch, AbsPitch)

-- A melody phrase (one rest and a triple) in first half of the piece
tPhrase :: Pitch -> Triple -> Music Pitch
tPhrase p (t1, t2, t3) = rest sn :+: triple
  where triple = line $ map (note sn) [trans t1 p, trans t2 p, trans t3 p]

-- melody bars
genMLine = line . map (uncurry tPhrase)

t35  = (0, 3, 5)
t38  = (0, 3, 8)
t39  = (0, 3, 9)
t310 = (0, 3, 10)
t45  = (0, 4, 5)
t49  = (0, 4, 9)
t56  = (0, 5, 6)
t57  = (0, 5, 7)
t58  = (0, 5, 8)
t59  = (0, 5, 9)
t510 = (0, 5, 10)
t69  = (0, 6, 9)
t78  = (0, 7, 8)
t79  = (0, 7, 9)
t710 = (0, 7, 10)
t711 = (0, 7, 11)

c4 = (C,4)
g4 = (G,4)

m1 = genMLine [(g4, t59), (g4, t59), (g4, t57), ((B,4), t38)]
m2 = genMLine [((A,4), t510), ((A,4), t58), ((A,4), t57), ((C,5), t49)]
m3 = genMLine [((B,4), t510), ((B,4), t58), ((C,5), t45), (g4, t710)]
m4 = genMLine [(g4, t79), (g4, t59), ((A,4), t35), ((E,4), t710)]
m5 = genMLine [((E,4), t78), ((E,4), t58), ((F,4), t45), (c4, t710)]
m6 = genMLine [(c4, t79), (c4, t59), ((D,4), t39), ((E,4), t38)]
m7 = genMLine [((D,4), t510), ((D,4), t59), (c4, t711), (c4, t69)]
m8 = genMLine [((B,3), t310), ((B,3), t38), ((A,3), t310), ((A,3), t38)]
m9 = b 3 qn :=: d 4 qn :=: f 4 qn

melody :: Music Pitch
melody = line [m1, m2, m3, m4, m5, m6, m7, m8, m9]

-- a bass phrase in the first half of the piece
bPhrase :: [Pitch] -> Music Pitch
bPhrase = line . map (note qn)

b1 = bPhrase [(C,3), (E,3), (G,3), (G,2)]
b2 = bPhrase [(D,3), (F,3), (A,3), (A,2)]
b3 = bPhrase [(E,3), (E,4), (A,3), (B,3)]
b4 = bPhrase [(C,4), (E,3), (Fs,3), (Gs, 3)]
b5 = bPhrase [(A,3), (C,3), (D,3), (E,3)]
b6 = bPhrase [(F,3), (E,3), (D,3), (C,3)]
b7 = bPhrase [(G,3), (G,2), (G,3), (G,2)]
b8 = b7
b9 = bPhrase [(G,3)]

-- bass bars

bass = line [b1, b2, b3, b4, b5, b6, b7, b8, b9]

-- putting it together...

piece :: Music Pitch
piece = let t = 50 / 120
        in tempo t (melody :=: bass)

