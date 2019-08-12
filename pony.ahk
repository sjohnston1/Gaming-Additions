Process,Priority,,High
^+p::reload ; Ctrl + Shift + P pauses the script (Starts from the top next time it's ran)
^+x:: ; Ctrl + Shift + X starts the script
; MUST SET GAME TO WINDOWED MODE AND THE RESOLUTION TO 800X600, ALSO, IT MAY NOT WORK IF YOU HAVE THE SCALING ON WINDOWS SET HIGHER THAN 100%!
; USE "RAW INPUT" AS MOUSE INPUT METHOD IN GTA SETTINGS
Loop
{
    WinActivate, ahk_exe GTA5.exe
    Sleep 2000
    MouseClick, left, 300, 200,,8,D ;Clicks Horse 1, edit this to change which horse is picked;
    Sleep 20
	MouseClick, left,,,,8,U ;These lines release the last click;
	MouseClick, left, 609, 299,,8,D ;Clicks and holds increase bet;
	MouseClick, left, 609, 441,,16,D ;Clicks and holds start race;
	Sleep 10000
	MouseClick, left,,,,8,U 
	Sleep 25000
	MouseClick, left, 403, 561,,8,D ;Clicks "Bet Again";
	Sleep 20
	MouseClick, left,,,,8,U
	MouseClick, left, 550, 502,,8,D ;Clicks "Place Bet" on main screen;
	Sleep 20
	MouseClick, left,,,,8,U
	Sleep 300
	
}
return