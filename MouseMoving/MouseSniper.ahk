#SingleInstance force
#include MouseDelta.ahk

AHeld := 0
BHeld := 0
CHeld := 0
DHeld := 0

md := new MouseDelta("MouseEvent").Start()

hotkey, % "F24", CentrePressed
hotkey, % "F23", ZoomPressed
hotkey, % "F22", FastPressed
hotkey, % "F21", MedPressed
hotkey, % "F20", SlowPressed
hotkey, % "F20 up", SlowUp
hotkey, % "F21 up", MedUp
hotkey, % "F22 up", FastUp
hotkey, % "F23 up", ZoomUp
return
 
CentrePressed:
	CoordMode, Mouse, Screen
	MouseMove, A_ScreenWidth/2, A_ScreenHeight/2, 0
	return
SlowPressed:
	global AHeld
	AHeld = 1
	return
MedPressed:
	global BHeld
	BHeld = 1
	return
FastPressed:
	global CHeld
	CHeld = 1
	return
ZoomPressed:
	global DHeld
	DHeld = 1
	return

SlowUp:
 	AHeld = 0
	return
MedUp:
	BHeld = 0
	return
FastUp:
	CHeld = 0
	return
ZoomUp:
	DHeld = 0
	return

; Gets called when mouse moves or stops
; x and y are DELTA moves (Amount moved since last message), NOT coordinates.
MouseEvent(MouseID, x := 0, y := 0){
	ScaleFactor = 0.0
	if(AHeld){
		ScaleFactor = -0.7
	}else if(BHeld){
		ScaleFactor = 1.3
	}else if(CHeld){
		ScaleFactor = 4
	}else if(DHeld){
		ScaleFactor = 9
	}else{
		ScaleFactor = 0.0
	}
	if (MouseID and ScaleFactor != 0.0){
		x *= ScaleFactor, y *= ScaleFactor
		DllCall("mouse_event",uint,1,int, x ,int, y,uint,0,int,0)
	}
}



F14::Send {WheelDown 1}
+F14::Send {WheelUp 1}

!F14::Send {WheelDown 12}
!+F14::Send {WheelUp 12}

^F14::Send {WheelDown 4}
^+F14::Send {WheelUp 4}



F15::Send {Left 5}
+F15::Send {Down 5}
F16::Send {Up 5}
+F16::Send {Right 5}

!F15::Send {Left 12}
!+F15::Send {Down 12}
!F16::Send {Up 12}
!+F16::Send {Right 12}

^F15::Send {Left 2}
^+F15::Send {Down 2}
^F16::Send {Up 2}
^+F16::Send {Right 2}












