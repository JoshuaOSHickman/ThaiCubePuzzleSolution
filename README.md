ThaiCubePuzzleSolution
======================

A 3x3x3 cube created by a string of rotatable connected blocks.

The Solution Story
==================

So, I see this wooden 3x3x3 cube on a shelf at work. I make a comment about it looking like a silly easy version of the rubik's cube. Because, you know, it has two colors. The guy sitting next to it laughs, grabs it, unravels the blocks, and tosses it over. 

So I try and solve this for maybe 20 minutes before heading out for the day, and I can't get it. So I realize I can have an unambiguous record of the shape by making the blocks go only up and to the right, and writing down the length of each row. So I do that, and go home. 

I take this, think about how the puzzle works, encode it into COMPRUDER-SPEAK (in this case Haskell, for the List monad, which I am using for search/non-determinism/backtracking). I get the solution, map it out in my head to sanity check it, and go to sleep. At this point, it's maybe 3am, because it's Friday and I'm farting around on the internet and watching videos while I code. As a side note, Haskell seems to allow me to do the smartest, cleanest stuff while tired. I _totally_ lost track of what I was doing once or twice, but the compiler put me back on track no problem. I cannot understate how useful and interesting that is. 

Anyhow, after trying to explain this to some people, I realized they needed the pictures, so I started googling around. Turns out googling for "block cube puzzle 27" shows that the wider internets calls this the Snake Cube Puzzle. 
