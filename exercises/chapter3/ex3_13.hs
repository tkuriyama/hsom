import Euterpea

{-
Mode	Tonic relative
to major scale	Interval sequence	Example
Ionian	I	W–W–H–W–W–W–H	C–D–E–F–G–A–B–C
Dorian	II	W–H–W–W–W–H–W	D–E–F–G–A–B–C–D
Phrygian	III	H–W–W–W–H–W–W	E–F–G–A–B–C–D–E
Lydian	IV	W–W–W–H–W–W–H	F–G–A–B–C–D–E–F
Mixolydian	V	W–W–H–W–W–H–W	G–A–B–C–D–E–F–G
Aeolian	VI	W–H–W–W–H–W–W	A–B–C–D–E–F–G–A
Locrian	VII	H–W–W–H–W–W–W	B–C–D–E–F–G–A–B
-}

genScale :: Pitch -> Mode -> Music Pitch
genScale p Ionian = mkScale p [2, 2, 1, 2, 2, 2, 1]
genScale p Dorian = mkScale p [2, 1, 2, 2, 2, 1, 2] 
genScale p Phrygian = mkScale p [1, 2, 2, 2, 1, 2, 2]
genScale p Lydian = mkScale p [2, 2, 2, 1, 2, 2, 1]
genScale p Mixolydian = mkScale p [2, 2, 1, 2, 2, 1, 2]
genScale p Aeolian = mkScale p [2, 1, 2, 2, 1, 2, 2]
genScale p Locrian = mkScale p [1, 2, 2, 1, 2, 2, 2]

mkScale :: Pitch -> [Int] -> Music Pitch
mkScale p is = line $ map (\i -> note qn $ trans i p) $ is'
  where is' = reverse . snd $
              foldl (\(s, acc) i -> (s+i, (s+i):acc)) (0, [0]) is
