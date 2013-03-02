
import Data.Maybe(listToMaybe)

nchoices :: [a] -> Int -> [[a]]
nchoices choices 0 = [[]]
nchoices choices n = [choice:(shorter_choices) | choice <- choices, shorter_choices <- nchoices choices (n - 1)]

data Connection = Straight | Bent deriving(Eq, Show)
connections = [Straight, Straight, Bent, 
							 Straight, Bent, 
							 Straight, Bent, 
							 Straight, Bent,
							 Bent,
							 Bent,
							 Bent,
							 Straight, Bent,
							 Straight, Bent,
							 Bent,
							 Bent,
							 Straight, Bent,
							 Bent,
							 Straight, Bent,
							 Bent,
							 Bent,
							 Straight]

data Orientation = In | Out | Up | Down | North | South deriving(Eq, Ord, Enum, Show)

reverseOrientation North = South
reverseOrientation South = North
reverseOrientation Up 	 = Down
reverseOrientation Down  = Up
reverseOrientation In 	 = Out
reverseOrientation Out 	 = In

turnOptions orientation = filter (\i -> i /= orientation && i /= reverseOrientation orientation) (enumFromTo In South)

data Location = Location Int Int Int deriving (Eq, Show)

nextLocation (Location x y z) North = Location x (y + 1) z
nextLocation (Location x y z) South = Location x (y - 1) z
nextLocation (Location x y z) In    = Location (x + 1) y z
nextLocation (Location x y z) Out   = Location (x - 1) y z
nextLocation (Location x y z) Up    = Location x y (z + 1)
nextLocation (Location x y z) Down  = Location x y (z - 1)

nextLocationOptions location current_orientation Straight = 
	[(current_orientation, nextLocation location current_orientation)]
nextLocationOptions location current_orientation Bent =
	map (\direction -> (direction, nextLocation location direction)) $
	(turnOptions current_orientation)

withinBounds (Location x y z) = 0 <= x && x <= 2 && 0 <= y && y <= 2 && 0 <= z && z <= 2

nextValidLocations location current_orientation connection = 
	filter (\(_, location) -> withinBounds location) $
	(nextLocationOptions location current_orientation connection)

validPaths :: [Connection] -> Location -> Orientation -> [[Location]]
validPaths [] position current_orientation = [[position]]
validPaths (nextConnection:otherConnections) position current_orientation = map (position:) $ 
	filter (not . (position `elem`)) $
	concat $ 
	map (\(direction, location) -> validPaths otherConnections location direction) $
	(nextValidLocations position current_orientation nextConnection)


main = print $ listToMaybe $ concat $ do
	initial_orientation <- (enumFromTo In South)
	x <- [0..2]
	y <- [0..2]
	z <- [0..2]]
	validPaths connections (Location x y z) initial_orientation 
	