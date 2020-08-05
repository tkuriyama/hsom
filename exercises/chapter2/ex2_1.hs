import Euterpea

type Major = Bool

-- 2.2

t251 :: Music Pitch
t251 = let dMinor = d 4 wn :=: f 4 wn :=: a 4 wn
           gMajor = g 4 wn :=: b 4 wn :=: d 5 wn
           cMajor = c 4 bn :=: e 4 bn :=: g 4 bn
           in dMinor :+: gMajor :+: cMajor

triad :: Music Pitch -> Major -> Music Pitch
triad n m = n :=: n' :=: n''
  where n' = transpose (if m then 4 else 3) n
        n'' = transpose 7 n

twoFiveOne :: Pitch -> Dur -> Music Pitch
twoFiveOne p d = let n = note d p
                     five = triad (transpose 7 n) True
                     two = triad (transpose 2 n) False
                     one = triad (note (d*2) p) True
                 in two :+: five :+: one
