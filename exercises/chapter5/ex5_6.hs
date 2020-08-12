import Euterpea

addDur :: Dur -> [Dur -> Music a] -> Music a
addDur d ns = line [n d | n <- ns]

addDur' :: Dur -> [Dur -> Music a] -> Music a
addDur' d = line . map (\n -> n d)
