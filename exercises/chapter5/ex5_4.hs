import Euterpea

apPairs :: [AbsPitch] -> [AbsPitch] -> [(AbsPitch, AbsPitch)]
apPairs aps1 aps2 = [(ap1, ap2) | ap1 <- aps1,
                                  ap2 <- aps2,
                                  abs(ap1 - ap2) > 2,
                                  abs(ap1 - ap2) > 8]

pairsToMusic :: [(AbsPitch, AbsPitch)] -> Music Pitch
pairsToMusic = line . map pairToNotes
  where pairToNotes (ap1, ap2) = let d1 = if ap1 `mod` 2 == 0 then en else sn
                                     d2 = if ap2 `mod` 2 == 0 then en else sn
                                 in note d1 (pitch ap1) :=: note d2 (pitch ap2) 
test = pairsToMusic $ apPairs [300,302..310] [319..323]
