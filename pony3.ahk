CoordMode, Mouse, Window
GTA := WinExist("Grand Theft Auto V")
WinGetPos, winX, winY, winWidth, winHeight, ahk_id %GTA%
	
Gui, New, -MinimizeBox +AlwaysOnTop +HWNDmsg, Pony v1.1
Gui, Add, Text,, `n Pick your pony:
Gui, Add, Edit, w100 ReadOnly
Gui, Add, UpDown, vPony Range1-6, 1
Gui, Add, Text,,
Gui, Add, Button, w300, Start
Gui, Add, Button, w300, Stop
Gui, Add, Text,, Waiting...
Gui, Add, Text,, Is GTA running? Only 1920 x 1080 or 2560 x 1080 supported! Borderless windowed only!
GuiControl, Hide, Only
;Gui, Add, Button, w300, Test
Gui, Add, Button, +Default w300, Close
GuiControl, Focus, Close
Gui, Show, AutoSize

WinGetPos, ahkX, ahkY, ahkWidth, ahkHeight, ahk_exe AutoHotKey.exe
MouseMove, (ahkWidth/2), (ahkHeight/2), Relative
If (winWidth = 2560) {
	global ScaleX := 1
}
Else If (winWidth = 1920) {
	global ScaleX := 0.75
}
Else {
	GuiControl, Hide, Waiting...
	GuiControl, Disable, Waiting...
	GuiControl, Show, Only
	GuiControl,, Waiting..., %Error%
	GuiControl, Disable, Stop
	GuiControl, Disable, Pony
	GuiControl, Disable, Edit
	GuiControl, Disable, Start
	Return
}

Begin:
global Start := 0
GuiControl, Disable, Stop
GuiControl, Enable, Pony
GuiControl, Enable, Edit
GuiControl, Enable, Start
Return

ButtonStart:
	Gui, Submit, NoHide
	GuiControl, Disable, Pony
	GuiControl, Disable, Edit
	GuiControl, Disable, Start
	GuiControl, Enable, Stop
	;MsgBox, 4096,, Pony: %Pony%
	GuiControl,, Waiting..., Running...
	global Start := 1
	WinActivate, Grand Theft Auto V ahk_class grcWindow
	While Start {
			;Clicks to ensure focus
			If %Start% {
				RelX := ScaleX*1920
				;MsgBox,4096,, winWidth: %winWidth% `n ScaleX: %ScaleX% `n RelX: %RelX%
				Click, L, %RelX%, 865,,, D
				Sleep 250
				Click, L, %RelX%, 865,,, U
				Sleep, 250
			}
			Else {
				Goto Begin
			}
			;Clicks Place Bet
			If %Start% {
				RelX := 1920*ScaleX
				Click, L, %RelX%, 865,,, D
				Sleep 250
				Click, L, %RelX%, 865,,, U
				Sleep, 250
			}
			Else {
				Goto Begin
			}
			;Clicks Pony
			If %Start% {
				If (Pony = 1) {
					PonyY := 300
				}
				If (Pony = 2) {
					PonyY := 500
				}
				If (Pony = 3) {
					PonyY := 600
				}
				If (Pony = 4) {
					PonyY := 700
				}
				If (Pony = 5) {
					PonyY := 800
				}
				If (Pony = 6) {
					PonyY := 900
				}
				;MsgBox, 4096,, Pony = %Pony% `n PonyY = %PonyY%
				RelX := 500*ScaleX
				Click, L, %RelX%, %PonyY%,,, D
				Sleep 250
				Click, L, %RelX%, %PonyY%,,, U
				Sleep 250
			}
			Else {
				Goto Begin
			}
			;Clicks Place Bet
			If %Start% {
				RelX := 2000*ScaleX
				Click, L, %RelX%, 750,,, D
				Sleep, 10
				Click, L, %RelX%, 750,,, U
				Sleep, 10
			}
			Else {
				Goto Begin
			}
			;Clicks and holds bet increase
			If %Start% {
				RelX := 2030*ScaleX
				Click, L, %RelX%, 530,,, D
				Loop, 35 {
					If %Start% {
						Sleep, 1000
					}
				}
				If %Start% {
					RelX := 2030*ScaleX
					Click, L, %RelX%, 530,,, U
					Sleep, 250
				}
				Else {
				Goto Begin
				}
			}
			Else {
				Goto Begin
			}
			;Exits menu for pending transactions
			If %Start% {
				RelX := 1275*ScaleX
				Click, R, %RelX%, 1000,,, D
				Sleep, 250
				Click, R, %RelX%, 1000,,, U
				Sleep, 250
				Click, R, %RelX%, 1000,,, D
				Sleep, 250
				Click, R, %RelX%, 1000,,, U
				Sleep, 250
			}
			Else {
				Goto Begin
			}
			;Enters menu to continue loop
			If %Start% {
				RelX := 1920*ScaleX
				Click, L, %RelX%, 865,,, D
				Sleep 250
				Click, L, %RelX%, 865,,, U
				Sleep, 250
			}
			Else {
				Goto Begin
			}
		}
	Goto Begin

ButtonStop:
	GuiControl,,Running..., Waiting...
	Goto Begin

ButtonClose:
	GuiClose:
		Gui, Destroy
		ExitApp