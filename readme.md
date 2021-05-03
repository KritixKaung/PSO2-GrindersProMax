# Grinder Buying/Selling automation tool using autohotkey script for PSO2

**What's new in V3**
* Excube limit mode is added
* Fixed calculation mistake in code which was counting grinder bought per loop as 999 when in reality you only buy 990 grinder each time in the game
* Added excube used information to various status texts

## Important note
It is best to bring this program to foreground with F1 to perform tasks while you're in the game instead of alt tabbing because alt tabbing might mess up with selections in the game. And it is important that you don't input anything into the game while the script is running.

## Script Timing
This script is created for 144fps+ and around 100ping to server, if your performance has a huge difference from this the script might not perform as intended for you. If so try increasing sleep timers in 50ms increments.

## How To use:

### Buying Process
Walk to excube npc, position yourself where interaction is targeted, start buying process. **The script will run for maximum loops assuming you have over 2100 excubes and 0 grinders in your material storage if you don't set excube limit or meseta target.**
#### Imporant Note: you must set your inventory to material tab and have no items in there prior to starting this script. 
The auto buying and selling works best if you have 0 grinders in your material storage. If you have some grinders in your storage it is best to clean them up first using manual selling function.
#### You can set how much meseta you want firstly and the script will only buy enough grinders to reach your targeted meseta. ***This is useful if you want some quick meseta to grab that LA on the market fast.*** (1 means 1 million meseta target, max is 25 milliions target because that's around the maximum amount of grinders your mat stroage can handle. 0 means no target and the script will buy the max amount of grinders)
#### You can also set excube target amount instead of meseta target and the buying script will run until it finished using the amount of excube you've inputted and it will never exceed the amount of excube you've inputted as long as there's no timing errors. (for example, if you put 100 as excube limit, it will run 3 times using 99 excubes but not 4 times and using over 100 excube.) The limit goes in increment of 100 up to 2100 because that's around the maximum amount of grinders your mat stroage can handle. 0 means no target and the script will buy the max amount of grinders ***This is useful if you have less than 2100 excubes and want to automate the buying process without having to manually look at it and stop when you run out of excube.***
You can also see the amount of grinders you have bought and meseta amount of it in the GUI so if you're only buying for a small amount of money you can end the buying process sooner by clicking Stop Buying button

### Selling Process
Go to any NPC where you can sell items > Sell Items from Storage > Material Storage> Input Grinder in search and have grinders as your selection and start selling process
