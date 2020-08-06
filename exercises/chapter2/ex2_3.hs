import Euterpea

{-
absPitch :: Pitch -> AbsPitch
absPitch (pc, oct) = 12 * (oct + 1) + pcToInt pc

pitch :: AbsPitch -> Pitch
pitch ap = let (oct, n) = divMod ap 12
           in ([C, Cs, D, Ds, E, F, Fs, G, Gs, A, As, B] !! n, oct - 1) 
-}

test = all (\ap -> absPitch (pitch ap) == ap) [0..1000]

test2 = all (\p -> pitch (absPitch p) == p) $
        [(pc, oct) | pc <- [C, Cs, D, Ds, E, F, Fs, G, Gs, A, As, B],
                     oct <- [1..8]]

{-
1. apsPitch (pitch ap) == ap

Assume by construction intToPc (pcToInt pc) == pc

Following the order of operations,

pitch ap = (intToPc (ap `mod` 12), (ap `div` 12) - 1)
absPitch (pitch ap) = (12 * ((ap `div` 12) - 1) + 1) + (pcToInt $ intToPc (ap `mod` 12))
                    = (12 * (ap `div` 12) + (ap `mod` 12)
                    = ap

pitch (absPitch p) == p

Trivially equivalent to above, other than enharmonic equivalences.

-}
