import Euterpea

{-

Lemma 1: reverse (reverse l) == l

Lemma 2 retro . retro
Retro is the application of reverse; by Lemma 1, retro. retro == reverse . reverse

Lemma 3 invert . invert
For any given p, the inversion is defined as 2ap - p.
The inversion of inversion is, by simple substitution, 2ap - (2ap - p) == p.

Lemma 4 retroInvert . invertRetro 
if retro' is inverse of retro and invert' is inverse of invert, it follows logically that:

   retro . invert == invert' . retro' (4.1)

Since invert and invert' are applied to the same sequence by Lemma 2.

Since invert == invert 'and retro == retro' (they are involutions), (4.1) is equivalent to Lemma 4.
g
-}
