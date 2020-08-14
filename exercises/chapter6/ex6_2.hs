import Euterpea

twelveNotes :: [Music Pitch] -> Bool
twelveNotes = (== 12) . length 

musicToPitch :: Music Pitch -> Pitch
musicToPitch (Prim (Note _ p)) = p

allPC :: [Music Pitch] -> Bool
allPC m = all (valid aps) [0..11]
  where aps = map (absPitch . musicToPitch) m
        valid aps apRef = any (\ap -> ap `mod` 12 == apRef) aps

properRow :: Music Pitch -> Bool
properRow m = twelveNotes m' && allPC m'
  where m' = lineToList m >>= \x -> case x of (Prim (Note _ _)) -> [x]; _ -> []

goodRow = line $ map (\ap -> note qn (pitch ap)) [60..71]
badRow = line $ map (\ap -> note qn (pitch ap)) $ [60..70] ++ [72]

test = properRow goodRow && (not $ properRow badRow)
