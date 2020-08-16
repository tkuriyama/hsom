import Euterpea

piece = line $ map f [35..82]
  where f ps = times 5 $ instrument Percussion $ note en (pitch ps)
