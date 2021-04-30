# Grinder Buying/Selling automation tool using autohotkey script for PSO2

**What's new in V2**
* Increased timings for all process (v1 has very tight timings and most of the people have errors because of that so the sleep timings between key inputs are increased all across the board, especially server actions)
* Added reload key (F6) which will reload the whole script. This is so that you can restart the program if something goes wrong immediately without having to run it again from explorer.
* Added stop selling button which will immediately stop the automatic selling process and reload the script
* Various modifications to enable/disable buttons according to what the user is doing currently.

## Important note
It is best to bring this program to foreground with F1 to perform tasks while you're in the game instead of alt tabbing because alt tabbing might mess up with selections in the game. And it is important that you don't input anything into the game while the script is running.

## Script Timing
This script is created for 144fps+ and around 100ping to server, if your performance has a huge difference from this the script might not perform as intended for you. If so try increasing sleep timers in 50ms increments.

## How To use:

### Buying Process
Walk to excube npc, position yourself where interaction is targeted, start buying process
**Imporant Note**: you must set your inventory to material tab and have no items prior to starting this script. 
The auto buying and selling works best if you have 0 grinders in your material storage. If you have some grinders in your storage it is best to clean them up first using manual selling function.
You can set how much meseta you want firstly and the script will only buy enough grinders to reach your targeted meseta. (1 means 1 million meseta target, max is 25 milliions target because that's around the maximum amount of grinders your mat stroage can handle. 0 means no target and the script will buy the max amount of grinders)
You can also see the amount of grinders you have bought and meseta amount of it in the GUI so if you're only buying for a small amount of money you can end the buying process sooner by clicking Stop Buying button

### Selling Process
Go to any NPC where you can sell items > Sell Items from Storage > Material Storage> Input Grinder in search and have grinders as your selection and start selling process
