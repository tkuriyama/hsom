import Euterpea

funkGroove :: Music Pitch
funkGroove =
  let p1 = perc LowTom qn
      p2 = perc AcousticSnare en
  in tempo 2 $
     (forever $ perc ClosedHiHat en)
     /=:
     (forever (p1 :+: qnr :+: p2 :+: qnr :+: p2 :+: p1
              :+: p1 :+: qnr :+: p2 :+: enr))
     
melody :: Music Pitch
melody = tempo 2 $ forever $ line $
         map (\ap -> note qn (pitch ap)) aps
  where ns = [60, 65, 67, 69, 64, 60]
        aps = ns ++ (map (+3) ns)

piece = cut 3 $ funkGroove :=: melody
