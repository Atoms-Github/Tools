#SingleInstance force
#include MouseDelta.ahk

ScaleFactor := 0

md := new MouseDelta("MouseEvent").Start()

hotkey, % "F22", FastPressed
hotkey, % "F23", MedPressed
hotkey, % "F24", SlowPressed
hotkey, % "F22 up", SpeedReleased
hotkey, % "F23 up", SpeedReleased
hotkey, % "F24 up", SpeedReleased
return
 
SlowPressed:
	ScaleFactor = -0.5
	return
MedPressed:
	ScaleFactor = 3
	return
FastPressed:
	ScaleFactor = 5
	return

SpeedReleased:
	ScaleFactor = 0
	return

; Gets called when mouse moves or stops
; x and y are DELTA moves (Amount moved since last message), NOT coordinates.
MouseEvent(MouseID, x := 0, y := 0){
	global ScaleFactor
 
	if (MouseID and ScaleFactor != 0){
		x *= ScaleFactor, y *= ScaleFactor
		DllCall("mouse_event",uint,1,int, x ,int, y,uint,0,int,0)
	}
}
