#SingleInstance force
#include MouseDelta.ahk

ScaleFactor := 0
QtyHeld := 0

md := new MouseDelta("MouseEvent").Start()

hotkey, % "F24", CentrePressed
hotkey, % "F23", ZoomPressed
hotkey, % "F22", FastPressed
hotkey, % "F21", MedPressed
hotkey, % "F20", SlowPressed
hotkey, % "F20 up", SpeedReleased
hotkey, % "F21 up", SpeedReleased
hotkey, % "F22 up", SpeedReleased
hotkey, % "F23 up", SpeedReleased
return
 
CentrePressed:
	QtyHeld = 0
	ScaleFactor = 0
	CoordMode, Mouse, Screen
	MouseMove, A_ScreenWidth/2, A_ScreenHeight/2, 0
	return
SlowPressed:
	QtyHeld += 1
	ScaleFactor = -0.5
	return
MedPressed:
	QtyHeld += 1
	ScaleFactor = 3
	return
FastPressed:
	QtyHeld += 1
	ScaleFactor = 5
	return
ZoomPressed:
	QtyHeld += 1
	ScaleFactor = 5
	return

SpeedReleased:
	QtyHeld -= 1
	if (QtyHeld == 0){
		ScaleFactor = 0
	}
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
