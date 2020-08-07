
{-
3.2 Show that flip (flip f) is the same as f

Prelude> :t flip
flip :: (a -> b -> c) -> b -> a -> c
flip f x y = f y x

(flip f) is a partially applied function that, when passed args x y, yelds (f y x).

So flip (flip f) == flip (f y x), which by definition of flip is f x y.

-}

f a b = (a*2, b*4)

test = (flip (flip f) 3 3) == (6, 12)
