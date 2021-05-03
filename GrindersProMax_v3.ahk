/*
!Important note!
It is best to bring this program to foreground with F1 to perform tasks while you're in the game instead of alt tabbing because alt tabbing might mess up with selections in the game. And it is important that you don't input anything into the game while the script is running.

!Script Timing!
This script is created for 144fps+ and around 100ping to server, if your performance has a huge difference from this the script might not perform as intended for you. If so try increasing sleep timers in 50ms increments.

How To use:
!Buying Process! 
Walk to excube npc, position yourself where interaction is targeted, start buying process
Imporant Note: you must set your inventory to material tab and have no items prior to starting this script. 
The auto buying and selling works best if you have 0 grinders in your material storage. If you have some grinders in your storage it is best to clean them up first using manual selling function.
You can set how much meseta you want firstly and the script will only buy enough grinders to reach your targeted meseta. (1 means 1 million meseta target, max is 25 milliions target because that's around the maximum amount of grinders your mat stroage can handle. 0 means no target and the script will buy the max amount of grinders)
You can also see the amount of grinders you have bought and meseta amount of it in the GUI so if you're only buying for a small amount of money you can end the buying process sooner by clicking Stop Buying button

!Selling Process!
Go to any NPC where you can sell items > Sell Items from Storage > Material Storage> Input Grinder in search and have grinders as your selection and start selling process

*/
#maxThreadsPerHotkey, 2
GrinderMaxBuyAmount := 64
GrinderSellAmount := 0
SoldGrinderAmount := 0
TargetMeseta := 0
ExcubeLimit := 0
toggle := false
toogle1 := false




WinGet, programid, List, Phantasy Star Online 2
Gui, Main:add, Text,r5 x15 y5 w225 Center vStatus,Idle.... `n Press F1 to insta-focus this program `n Press F4 to force close this program. `n Press F2 to see instuctions and script. `n Press F6 to reload program.
Gui, Main:Add, Radio, vLimitRadioGroup1 gExcubeLimit, Excube Limit (max 2100) -
Gui, Main:Add, Radio, vLimitRadioGroup2 gMesetaLimit, Meseta Target (in millions) -
SetFormat,float,0
VarEdit = 0
Var:=(varedit*100)
Gui, Main:Add, Edit, x170 y72 w50 right number readonly vVar,%var%
Gui, Main:Add, UpDown, -2 hp x+0 wrap vExcubeTarget gVarEdit Range0-21,%varedit%
Gui, Main:Add, Edit, x180 y97 w40 right number readonly
Gui, Main:Add, UpDown, vTargetMeseta Range0-25, 0
Gui, Main:add, button, x15 y120 w100 h25 vBuyBtn gStartBuying, Start Buying
Gui, Main:add, button, x130 y120 w100 h25 vBreakBtn gBreak, Stop Buying
Gui, Main:add, button, x15 y150 w100 h25 vSellBtn gStartSelling, Start Selling
Gui, Main:add, button, x130 y150 w100 h25 vStopSellingBtn gStopSelling, Stop Selling
Gui, Main:add, button, x10 y180 w110 h25 vStartSellingManuallyBtn gStartSellingManually, Start Selling Manually
Gui, Main:add, button, x130 y180 w110 h25 vStopManualSellBtn gStopManualSell, Stop Manual Selling
Gui, Main:Default
Gui, -sysmenu
gui, Main:show,,Grinders Pro Max v3
GuiControl,Disable,SellBtn
GuiControl,Disable,StopManualSellBtn
GuiControl,Disable,StopSellingBtn
GuiControl,Disable,ExcubeTarget
GuiControl,Disable,TargetMeseta


return

VAREDIT:
var:=(ExcubeTarget*100)
GuiControl,,var,%var%
RETURN

ExcubeLimit:
GuiControl,Enable,ExcubeTarget
GuiControl,Disable,TargetMeseta
GuiControl,, TargetMeseta, 0
return

MesetaLimit:
GuiControl,Disable,ExcubeTarget
GuiControl,Enable,TargetMeseta
GuiControl,, ExcubeTarget, 0
GuiControl,,var,0
return



StartBuying: ;Button Action
GuiControl,Disable,LimitRadioGroup1
GuiControl,Disable,LimitRadioGroup2
GuiControl,Disable,BuyBtn
GuiControl,Disable,StartSellingManuallyBtn
GuiControlGet, TargetMeseta
GuiControlGet, ExcubeTarget
If (TargetMeseta > 0){
	TargetMeseta := TargetMeseta*1000000
	GrinderMaxBuyAmount := (TargetMeseta//399600)+1
	UpdateStatus("Target Meseta Amount - " . RegExReplace(TargetMeseta, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " `n Buying " . GrinderMaxBuyAmount * 990 . " More Grinders...")
	GuiControl,Disable,TargetMeseta
}
	else if (ExcubeTarget > 0){
	ExcubeTarget := ExcubeTarget*100
	GrinderMaxBuyAmount := (ExcubeTarget//33)
	UpdateStatus("Target Excube Amount - " . RegExReplace(ExcubeTarget, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " `n Buying " . GrinderMaxBuyAmount * 990 . " More Grinders...")
	GuiControl,Disable,ExcubeTarget
	}
	else {
	UpdateStatus("Buying " . GrinderMaxBuyAmount * 990 . " More Grinders...")
	GuiControl,Disable,TargetMeseta
	GuiControl,Disable,ExcubeTarget
}
toggle := true
	While toggle = true
		if (GrinderMaxBuyAmount > 0){
			ControlSend,, {e}, ahk_id %programid1%;Open NPC
			Sleep, 1000
			ControlSend,, {Enter}, ahk_id %programid1% ;Open Shop (Server Action)
			Sleep, 750
			ControlSend,, {Left}, ahk_id %programid1% ;Max Buy
			Sleep, 300
			ControlSend,, {Enter}, ahk_id %programid1% ;Purchase
			Sleep, 300
			ControlSend,, {Enter}, ahk_id %programid1% ;Confirm Purchase (Server Action)
			Sleep, 600
			ControlSend,, {Enter}, ahk_id %programid1% ;Close Purchase Complete
			Sleep, 300
			ControlSend,, {Esc}, ahk_id %programid1% ;Close Shop
			Sleep, 300
			ControlSend,, {Esc}, ahk_id %programid1% ;Close NPC	
			Sleep, 300
			ControlSend,, {i}, ahk_id %programid1% ;Open Inventory
			Sleep, 450
			ControlSend,, {Shift}{Enter}, ahk_id %programid1% ;Select all of first item stack
			Sleep, 300
			ControlSend,, {Enter}, ahk_id %programid1% ;Open item menu
			Sleep, 300
			ControlSend,, {Down}, ahk_id %programid1% ;Storage selection start
			Sleep, 300
			ControlSend,, {Down}, ahk_id %programid1%
			Sleep, 300
			ControlSend,, {Down}, ahk_id %programid1%
			Sleep, 300
			ControlSend,, {Down}, ahk_id %programid1%
			Sleep, 300
			ControlSend,, {Down}, ahk_id %programid1%
			Sleep, 300
			ControlSend,, {Enter}, ahk_id %programid1% ;Deposit
			Sleep, 450
			ControlSend,, {Esc}, ahk_id %programid1% ;Close menu for re-run
			Sleep, 300
			--GrinderMaxBuyAmount
			++GrinderSellAmount
			UpdateStatus("Buying " . RegExReplace(GrinderMaxBuyAmount*990, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,")   . " More Grinders... `n" . RegExReplace(GrinderSellAmount*990, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " grinders bought `n" . RegExReplace(GrinderSellAmount*990*400, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " meseta worth `n" . RegExReplace(GrinderSellAmount*33, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " excubes used"  )
			}
		else {
			UpdateStatus("Ready to sell " . RegExReplace(GrinderSellAmount*990, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " Grinders `n" . RegExReplace(GrinderSellAmount*990*400, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " meseta worth `n" . RegExReplace(GrinderSellAmount*33, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " excubes used" )
			GuiControl,Disable,BuyBtn
			GuiControl,Enable,SellBtn
			GuiControl,Enable,StartSellingManuallyBtn
			MsgBox, 0, Grinders Bought!,% RegExReplace(GrinderSellAmount*990, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") " Grinders bought"
			Return
			}
	; This case needed in case the loop is interrupted by a toggle
	UpdateStatus("Ready to sell " . RegExReplace(GrinderSellAmount*990, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " Grinders `n" . RegExReplace(GrinderSellAmount*990*400, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " meseta worth"  )
	GuiControl,Enable,SellBtn
	GuiControl,Enable,StartSellingManuallyBtn
	MsgBox, 0, Grinders Bought!,% RegExReplace(GrinderSellAmount*990, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") " Grinder bought"
	Return

Break: ;Button Action
toggle := false ;while loop will stop with this
return

Reload: ;reload function
reload
return

StartSelling:
toogle1 = true	
GuiControl,Disable,BuyBtn
GuiControl,Disable,BreakBtn
GuiControl,Disable,SellBtn
GuiControl,Disable,StartSellingManuallyBtn
GuiControl,Disable,StopManualSellBtn
GuiControl,Enable,StopSellingBtn
	Loop {
		if (GrinderSellAmount > 0) {
			if (toogle1 = false) {
			break
			}
			else
			{
			ControlSend,, {Left}, ahk_id %programid1% 
			Sleep, 300
			ControlSend,, {Enter}, ahk_id %programid1%
			Sleep, 300
			ControlSend,, {Enter}, ahk_id %programid1%
			Sleep, 650	
			ControlSend,, {Enter}, ahk_id %programid1% 
			Sleep, 300	
			--GrinderSellAmount
			++SoldGrinderAmount
			UpdateStatus("Selling " . RegExReplace(GrinderSellAmount*990, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " More Grinders...")
			}
			}
		else {	
			toogle1 = false
			GuiControl,Disable,StopSellingBtn
			UpdateStatus("All Grinders Sold")
			GuiControl,Disable,SellBtn
			GuiControl,Enable,BuyBtn
			GuiControl,Enable,BreakBtn
			GuiControl,Enable,StartSellingManuallyBtn
			GuiControl,Enable,LimitRadioGroup1
			GuiControl,Enable,LimitRadioGroup2
			GuiControl,,TargetMeseta,0
			GuiControl,,ExcubeTarget,0
			GuiControl,,var,0
			MsgBox, 0, Grinders Sold!,% RegExReplace(SoldGrinderAmount*990, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") "Grinders sold for " RegExReplace(SoldGrinderAmount*990*400, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") " Meseta"
			GrinderMaxBuyAmount := 64
			SoldGrinderAmount := 0
			Exit
			}
		}
		
StopSelling:
toogle1 = false
GuiControl,Disable,BuyBtn
GuiControl,Disable,BreakBtn
GuiControl,Disable,SellBtn
GuiControl,Disable,StopSellingBtn
GuiControl,Disable,StartSellingManuallyBtn
GuiControl,Disable,StopManualSellBtn
UpdateStatus("User has suspended automatic selling process. `n The program will restart to initial state in 5 seconds")
Sleep, 3000
UpdateStatus("5")
Sleep, 1000
UpdateStatus("4")
Sleep, 1000
UpdateStatus("3")
Sleep, 1000
UpdateStatus("2")
Sleep, 1000
UpdateStatus("1")
Sleep, 1000
Reload			
return
	
StartSellingManually:
toggle := true
UpdateStatus("!!!MANUAL GRINDER SELLING PROCESS!!! `n Please keep an eye on your grinder count and stop the process when it is about to reach lambda grinders!")
GuiControl,Disable,SellBtn
GuiControl,Disable,BuyBtn
GuiControl,Disable,StartSellingManuallyBtn
GuiControl,Disable,TargetMeseta
GuiControl,Disable,ExcubeTarget
GuiControl,Disable,BreakBtn
GuiControl,Enable,StopManualSellBtn
	While toggle = true{
	ControlSend,, {Left}, ahk_id %programid1% 
	Sleep, 300
	ControlSend,, {Enter}, ahk_id %programid1%
	Sleep, 300
	ControlSend,, {Enter}, ahk_id %programid1%
	Sleep, 650	
	ControlSend,, {Enter}, ahk_id %programid1% 
	Sleep, 300	
	}
	
StopManualSell: ;Button Action
UpdateStatus("Idle.... `n Press F1 to insta-focus this program `n Press F4 to force close this program. `n Press F2 to see instuctions and script. `n Press F6 to reload program.")
GuiControl,Enable,BuyBtn
GuiControl,Enable,BreakBtn
GuiControl,Enable,StartSellingManuallyBtn
GuiControl,Enable,TargetMeseta
GuiControl,Enable,ExcubeTarget
GuiControl,Disable,StopManualSellBtn
toggle := false ;while loop will stop with this
return

UpdateStatus(status)
{
	GuiControl,,Status,%status%
}

#WinActivateForce
F1::WinActivate, Grinders Pro Max v3
return

F2::Run https://github.com/KritixKaung/PSO2-GrindersProMax/blob/master/readme.md
return 

F4::ExitApp

F6:: Reload
