import Euterpea

insideOut :: Music a -> Music a
insideOut = mFold Prim (:=:) (:+:) Modify

melody = line [c 4 qn, e 4 qn, g 4 qn] :=:
         line [e 4 qn, g 4 qn, c 5 qn] :=:
         line [g 5 qn, c 5 qn, e 4 qn]

toQn :: AbsPitch -> Music Pitch
toQn = note qn . pitch

melody2 = (line $ map toQn [60,63..72]) :=:
          (line $ map toQn [65,68..77]) :=:
          (line $ map toQn [67,70..79]) :=:
          (line $ map toQn [68,71..80]) 
  
piece m = m :+: rest 1 :+: (insideOut m)

