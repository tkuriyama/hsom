import Euterpea

retro' :: Music a -> Music a
retro' = mFold Prim switch switchDur Modify
  where switch m1 m2 = m2 :+: m1
        switchDur m1 m2 =
          let (d1, d2) = (dur m1, dur m2)
          in if d1 > d2 then m1 :=: (rest (d1-d2) :+: m2)
          else (rest (d2-d1) :+: m1) :=: m2

melody = (c 4 qn :+: e 4 qn :+: g 4 qn) :=: (a 3 qn :+: c 4 qn)
