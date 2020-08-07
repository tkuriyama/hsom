import Euterpea

{-
trans :: Int -> Pitch  -> Pitch
trans i p = pitch (absPitch p + i)
-}

test = all (\(i, j, p) -> trans i (trans j p) == trans (i + j) p) $
       [(i, j, (C, 4)) | i <- [0..100], j <- [0..100]]

{-
Show that trans i (trans j p) == trans (i + j) p

By definition, LHS = pitch (absPitch (pitch (absPitch p + j)) + i)

From ex2.3, we know that pitch (absPitch p) == p; so we can delete the inner functions as redundant, leaving pitch (absPitch p + j + i), or pitch (absPitch p + (i + j)). From the definition of trans, this is equivalent to trans (i + j) p, which is the RHS.
-}
