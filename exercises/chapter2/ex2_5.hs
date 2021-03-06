import Euterpea

transM :: AbsPitch -> Music Pitch -> Music Pitch
transM ap (Prim (Note d p)) = Prim (Note d (trans ap p))
transM ap (Prim (Rest d)) = Prim (Rest d)
transM ap (m1 :+: m2) = (transM ap m1) :+: (transM ap m2)
transM ap (m1 :=: m2) = (transM ap m1) :=: (transM ap m2)
transM ap (Modify c m) = Modify c (transM ap m)

-- Test with Blues Pitch from ex2.2

data BluesPitchClass = Ro | MT | Fo | Fi | MS

type BluesPitch = (BluesPitchClass, Octave)

ro, mt, fo, fi, ms :: Octave -> Dur -> Music BluesPitch
ro o d = note d (Ro, o); mt o d = note d (MT, o)
fo o d = note d (Fo, o); fi o d = note d (Fi, o)
ms o d = note d (MS, o)

fromBluesPitch :: BluesPitch -> Pitch
fromBluesPitch (Ro, o) = (C, o)
fromBluesPitch (MT, o) = (Ef, o)
fromBluesPitch (Fo, o) = (F, o)
fromBluesPitch (Fi, o) = (G, o)
fromBluesPitch (MS, o) = (Bf, o)

fromBlues :: Music BluesPitch -> Music Pitch
fromBlues (Prim (Note d p)) = Prim (Note d (fromBluesPitch p))
fromBlues (Prim (Rest d)) = Prim (Rest d)
fromBlues (m1 :+: m2) = (fromBlues m1) :+: (fromBlues m2)
fromBlues (m1 :=: m2) = (fromBlues m1) :=: (fromBlues m2)
fromBlues (Modify c m) = Modify c (fromBlues m)

m1 :: Music BluesPitch
m1 = ro 4 qn :+: fi 4 qn :+: ms 4 qn :+: fo 4 qn :+: fo 4 wn

playTransBlues ap = play . transM ap $ fromBlues m1
