i:rmport Euterpea
import Data.Ratio

type PV = (Pitch, Volume)

rep :: (Music a -> Music a) -> (Music a -> Music a) -> Int -> Music a -> Music a
rep f g 0 m = rest 0
rep f g n m = m :=: (g $ rep f g (n-1) (f m))

run :: Int -> Music PV
run i = let vs = [0,1 .. 70] ++ [70,69 .. 0]
            start = if i < 0 then 140 else 0
            end = if i < 0 then 0 else 140
            aps = [start,start+i .. end]
            f v ap = addVolume v $ note tn (pitch ap) 
        in line $ zipWith f vs aps

shepardScale :: Int -> Music PV
shepardScale inc =
  let c = chord [tempo t $ instrument i $ rest 0 :+: run d |
                 t <- [1%1, 105%100, 125%100, 75%100, 120%100, 80%100],
                 i <- [AcousticGrandPiano, RhodesPiano],
                 d <- [inc]]
      in rep id (offset (1)) 100 c
