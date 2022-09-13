#SingleInstance force
#include MouseDelta.ahk

Pressed0 := False
Pressed1 := False
Pressed2 := False
Pressed3 := False

md := new MouseDelta("MouseEvent").Start()

hotkey, % "F20", SlowPressed
hotkey, % "F20 up", SpeedReleased
hotkey, % "F21", MedPressed
hotkey, % "F21 up", SpeedReleased
hotkey, % "F22", FastPressed
hotkey, % "F22 up", SpeedReleased
hotkey, % "F23", ZoomPressed
hotkey, % "F23 up", SpeedReleased
hotkey, % "F24", CentrePressed
return
 
CentrePressed:
	ScaleFactor = 0
	CoordMode, Mouse, Screen
	MouseMove, A_ScreenWidth/2, A_ScreenHeight/2, 0
	return
SlowPressed:
	ScaleFactor = -0.8
	return
MedPressed:
	ScaleFactor = 1
	return
FastPressed:
	ScaleFactor = 3
	return
ZoomPressed:
	ScaleFactor = 7
	return

SpeedReleased:
	ScaleFactor = 0
	return

; Gets called when mouse moves or stops
; x and y are DELTA moves (Amount moved since last message), NOT coordinates.
MouseEvent(MouseID, x := 0, y := 0){
	if (MouseID){
		x *= ScaleFactor, y *= ScaleFactor
		DllCall("mouse_event",uint,1,int, x ,int, y,uint,0,int,0)
	}
}
