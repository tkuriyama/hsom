import Euterpea

mkScale :: Pitch -> [Int] -> Music Pitch
mkScale p is = line $ map (\i -> note qn $ trans i p) $ is'
  where is' = reverse . snd $
              foldl (\(s, acc) i -> (s+i, (s+i):acc)) (0, [0]) is
