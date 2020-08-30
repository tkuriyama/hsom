import Euterpea
rep :: (Music a -> Music a) -> (Music a -> Music a) -> Int -> Music a -> Music a
rep f g 0 m = rest 0
rep f g n m = m :=: (g $ rep f g (n-1) (f m))

run = rep (transpose 5) (offset tn) 8 (c 4 tn)
cascade = rep (transpose 4) (offset en) 8 run
cascades = rep id (offset sn) 2 cascade
final = cascades :+: retro cascades

-- run' = rep (offset tn) (transpose 5) 8 (c 4 tn)
-- cascade' = rep (offset en) (transpose 4) 8 run'
-- cascades' = rep (offset sn) id 2 cascade'
-- final' = cascades' :+: retro cascades'
-- s1 = [1,5,3,6,5,0,1,1]
-- s2 = [4,-2,3,-1,-5,1,0]
