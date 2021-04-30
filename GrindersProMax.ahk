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
toggle := false

WinGet, programid, List, Phantasy Star Online 2

Gui, Main:add, Text,r4 x15 y5 w225 Center vStatus,Idle.... `n Press F1 to insta-focus this program `n Press F4 to force close this program. `n Press F2 to see instuctions and script.
Gui, Main:Add, Text,x20, Meseta Target (in millions) -
Gui, Main:Add, Edit, x180 y60 w40 right number readonly
Gui, Main:Add, UpDown, vTargetMeseta Range0-25, 0
Gui, Main:add, button, x15 y90 w100 h25 vBuyBtn gStartBuying, Start Buying
Gui, Main:add, button, x130 y90 w100 h25 vBreakBtn gBreak, Stop Buying
Gui, Main:add, button, x60 w120 h25 vSellBtn gStartSelling, Start Selling
Gui, Main:add, button, x10 y150 w110 h25 vStartSellingManuallyBtn gStartSellingManually, Start Selling Manually
Gui, Main:add, button, x130 y150 w110 h25 vStopManualSellBtn gStopManualSell, Stop Manual Selling
Gui, Main:Default
Gui, -sysmenu
gui, Main:show,,Grinders Pro Max v1
GuiControl,Disable,SellBtn
GuiControl,Disable,StopManualSellBtn
return

StartBuying: ;Button Action
GuiControlGet, TargetMeseta
If (TargetMeseta > 0){
	TargetMeseta := TargetMeseta*1000000
	GrinderMaxBuyAmount := (TargetMeseta//399600)+1
	UpdateStatus("Target Meseta Amount - " . RegExReplace(TargetMeseta, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " `n Buying " . GrinderMaxBuyAmount * 999 . " More Grinders...")
	GuiControl,Disable,TargetMeseta
}
	else {
	UpdateStatus("Buying " . GrinderMaxBuyAmount * 999 . " More Grinders...")
	GuiControl,Disable,TargetMeseta
}
toggle := true
	While toggle = true
		if (GrinderMaxBuyAmount > 0){
			ControlSend,, {e}, ahk_id %programid1%;Open NPC
			Sleep, 650
			ControlSend,, {Enter}, ahk_id %programid1% ;Open Shop (Server Action)
			Sleep, 500
			ControlSend,, {Left}, ahk_id %programid1% ;Max Buy
			Sleep, 200
			ControlSend,, {Enter}, ahk_id %programid1% ;Purchase
			Sleep, 200
			ControlSend,, {Enter}, ahk_id %programid1% ;Confirm Purchase (Server Action)
			Sleep, 400
			ControlSend,, {Enter}, ahk_id %programid1% ;Close Purchase Complete
			Sleep, 200
			ControlSend,, {Esc}, ahk_id %programid1% ;Close Shop
			Sleep, 200
			ControlSend,, {Esc}, ahk_id %programid1% ;Close NPC	
			Sleep, 200
			ControlSend,, {i}, ahk_id %programid1% ;Open Inventory
			Sleep, 250
			ControlSend,, {Shift}{Enter}, ahk_id %programid1% ;Select all of first item stack
			Sleep, 200
			ControlSend,, {Enter}, ahk_id %programid1% ;Open item menu
			Sleep, 200
			ControlSend,, {Down}, ahk_id %programid1% ;Storage selection start
			Sleep, 200
			ControlSend,, {Down}, ahk_id %programid1%
			Sleep, 200
			ControlSend,, {Down}, ahk_id %programid1%
			Sleep, 200
			ControlSend,, {Down}, ahk_id %programid1%
			Sleep, 200
			ControlSend,, {Down}, ahk_id %programid1%
			Sleep, 200
			ControlSend,, {Enter}, ahk_id %programid1% ;Deposit
			Sleep, 200
			ControlSend,, {Esc}, ahk_id %programid1% ;Close menu for re-run
			Sleep, 200
			--GrinderMaxBuyAmount
			++GrinderSellAmount
			UpdateStatus("Buying " . RegExReplace(GrinderMaxBuyAmount*999, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,")   . " More Grinders... `n" . RegExReplace(GrinderSellAmount*999, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " grinders bought `n" . RegExReplace(GrinderSellAmount*999*400, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " meseta worth"  )
			}
		else {
			UpdateStatus("Ready to sell " . RegExReplace(GrinderSellAmount*999, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " Grinders `n" . RegExReplace(GrinderSellAmount*999*400, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " meseta worth" )
			GuiControl,Disable,BuyBtn
			GuiControl,Enable,SellBtn
			MsgBox, 0, Grinders Bought!,% RegExReplace(GrinderSellAmount*999, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") " Grinders bought"
			Return
			}
	; This case needed in case the loop is interrupted by a toggle
	UpdateStatus("Ready to sell " . RegExReplace(GrinderSellAmount*999, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " Grinders `n" . RegExReplace(GrinderSellAmount*999*400, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " meseta worth"  )
	GuiControl,Enable,SellBtn
	MsgBox, 0, Grinders Bought!,% RegExReplace(GrinderSellAmount*999, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") " Grinder bought"
	Return

Break: ;Button Action
toggle := false ;while loop will stop with this
return

StartSelling:
Loop {
	if (GrinderSellAmount > 0) {
		ControlSend,, {Left}, ahk_id %programid1% 
		Sleep, 200
		ControlSend,, {Enter}, ahk_id %programid1%
		Sleep, 200
		ControlSend,, {Enter}, ahk_id %programid1%
		Sleep, 400	
		ControlSend,, {Enter}, ahk_id %programid1% 
		Sleep, 200	
		--GrinderSellAmount
		++SoldGrinderAmount
		UpdateStatus("Selling " . RegExReplace(GrinderSellAmount*999, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " More Grinders...")
		}
	else {	
		UpdateStatus("All Grinders Sold")
		GuiControl,Disable,SellBtn
		GuiControl,Enable,BuyBtn
		GuiControl,Enable,TargetMeseta
		GuiControl,,TargetMeseta,0
		MsgBox, 0, Grinders Sold!,% RegExReplace(SoldGrinderAmount*999, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") "Grinders sold for " RegExReplace(SoldGrinderAmount*999*400, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") " Meseta"
		GrinderMaxBuyAmount := 64
		SoldGrinderAmount := 0
		Exit
		}
	}
	
StartSellingManually:
toggle := true
UpdateStatus("!!!MANUAL GRINDER SELLING PROCESS!!! `n Please keep an eye on your grinder count and stop the process when it is about to reach lambda grinders!")
GuiControl,Disable,SellBtn
GuiControl,Disable,BuyBtn
GuiControl,Disable,BreakBtn
GuiControl,Disable,StartSellingManuallyBtn
GuiControl,Disable,TargetMeseta
GuiControl,Enable,StopManualSellBtn
	While toggle = true{
	ControlSend,, {Left}, ahk_id %programid1% 
	Sleep, 200
	ControlSend,, {Enter}, ahk_id %programid1%
	Sleep, 200
	ControlSend,, {Enter}, ahk_id %programid1%
	Sleep, 400	
	ControlSend,, {Enter}, ahk_id %programid1% 
	Sleep, 200	
	}
	
StopManualSell: ;Button Action
UpdateStatus("Idle.... `n Press F4 to force close this program. `n Press F2 to see instuctions and script.")
GuiControl,Enable,SellBtn
GuiControl,Enable,BuyBtn
GuiControl,Enable,Break
GuiControl,Enable,StartSellingManuallyBtn
GuiControl,Enable,TargetMeseta
GuiControl,Disable,StopManualSellBtn
toggle := false ;while loop will stop with this
return

UpdateStatus(status)
{
	GuiControl,,Status,%status%
}
#WinActivateForce
F1::WinActivate, Grinders Pro Max v1
return

F2::Run https://github.com/KritixKaung/PSO2-GrindersProMax/blob/master/readme.md
return 

F4::ExitApp
