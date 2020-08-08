import Euterpea

interval :: AbsPitch -> AbsPitch -> [AbsPitch]
interval ap1 ap2
  | ap1 == ap2 = [ap1]
  | ap1 < ap2 = [ap1..ap2]
  | otherwise = [ap1,(ap1-1)..ap2]

chrom :: Pitch -> Pitch -> Music Pitch
chrom p1 p2 = line $
              map (\ap -> note qn (pitch ap)) $
              interval (absPitch p1) (absPitch p2)
