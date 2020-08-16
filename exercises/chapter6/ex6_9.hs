import Euterpea
import Data.Ratio

type PV = (Pitch, Volume)

scaleVolume :: Rational -> Music PV -> Music PV
scaleVolume s = mMap (\(p, v) -> (p, round $ (s * fromIntegral v)))

m1, m2 :: Music (Pitch, Volume)
m1 = addVolume 60 $ line [c 4 qn, d 4 qn, e 4 qn]
m2 = scaleVolume (4%2) m1
