import Euterpea

fuse :: [Dur] -> [Dur -> Music a] -> [Music a]
fuse ds ns = zipWith (\d n -> n d) ds ns

{-
*Main> fuse [qn, hn, sn] [c 4, d 4, e 4]
fuse [qn, hn, sn] [c 4, d 4, e 4]
[Prim (Note (1 % 4) (C,4)),Prim (Note (1 % 2) (D,4)),Prim (Note (1 % 16) (E,4))]
-}

