import Euterpea

musicToPitch :: Music Pitch -> Pitch
musicToPitch (Prim (Note _ p)) = p

isPalindromic :: (Eq a) => [a] -> Bool
isPalindromic xs = xs == (reverse xs)

palin :: Music Pitch -> Bool
palin = isPalindromic . map musicToPitch . lineToList

p1 = line $ map (\ap -> note qn (pitch ap)) [1,2,3,2,1]
p2 = line $ map (\ap -> note qn (pitch ap)) [2,2,2]
p3 = line $ map (\ap -> note qn (pitch ap)) [2,2,3,2]

test = palin p1 && palin p2 && (not $ palin p3)
