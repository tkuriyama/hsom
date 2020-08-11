import Euterpea

type Triple = (AbsPitch, AbsPitch, AbsPitch)

-- A melody phrase (one rest and a triple) in first half of the piece
tPhrase :: Pitch -> Triple -> [Music Pitch]
tPhrase p (t1, t2, t3) = map (note sn) [trans t1 p, trans t2 p, trans t3 p]

genMLine = concat . map (uncurry tPhrase)

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


m1 = genMLine [(g4, t59), (g4, t59), (g4, t57), ((B,4), t38)]
m2 = genMLine [((A,4), t510), ((A,4), t58), ((A,4), t57), ((C,5), t49)]

prefixes :: [a] -> [[a]]
prefixes [] = []
prefixes (x:xs) = let f pf = x:pf
                  in [x] : map f (prefixes xs)

prefix :: [Music a] -> Music a
prefix mel = let m1 = line $ concat (prefixes mel)
                 m2 = transpose 12 . line $ concat (prefixes mel)
                 m = instrument Flute m1 :=: instrument VoiceOohs m2
             in m :=: transpose 5 m :+: m

piece = prefix $ m1
