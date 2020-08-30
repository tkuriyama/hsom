import Euterpea

type PV = (Pitch, Volume)

-- Collatz

collatz :: (Integral a) => a -> a
collatz n | even n = n `div` 2
          | otherwise = n * 3 + 1

genSeq :: Integer -> [Int]
genSeq n = map fromIntegral $ (takeWhile (/= 1) $ iterate collatz n) ++ [1]

-- Percussion

funkGroove :: Music Pitch
funkGroove =
  let p1 = perc LowTom qn
      p2 = perc AcousticSnare en
  in tempo 1.5 $
     (forever $ perc ClosedHiHat en)
     /=:
     (forever (p1 :+: qnr :+: p2 :+: qnr :+: p2 :+: p1
              :+: p1 :+: qnr :+: p2 :+: enr))

funkGroove' :: Music PV
funkGroove' = addVolume 80 funkGroove

-- Melody

dampen :: Int -> Int -> Int
dampen c n = if n > c then c + vd else c - vd
  where vd = max 20 (abs $ n - c)

clampPitch :: Int -> Int
clampPitch n = 10 + (n `mod` 100)

p1 :: [Int] -> Music PV
p1 ns = tempo 1.5 $ instrument RhodesPiano $ l
  where ps = map (note en . pitch) . map clampPitch $ ns
        vs = map (dampen 100) ns
        f v p = addVolume v p
        l = line $ zipWith f vs ps

p1' :: [Int] -> Music PV
p1' ns = p1 ns :=: p1 ns'
  where ns' = map addChord ns
        addChord n = if even n then n+4 else n+9

phaseIt factor m = m :=: tempo factor m
  
p2 :: Music PV -> Music PV
p2 m = (m :=: m2) /=: funkGroove'
  where m2 = retro m

p3 :: Music PV -> Music PV
p3 m = phaseIt 1.01 (times 3 m)
