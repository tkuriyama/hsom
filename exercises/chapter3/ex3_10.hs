import Euterpea

maxAbsPitch :: [AbsPitch] -> AbsPitch
maxAbsPitch [] = error "list empty"
maxAbsPitch xs = maximum xs

minAbsPitch :: [AbsPitch] -> AbsPitch
minAbsPitch [] = error "list empty"
minAbsPitch xs = minimum xs
