menus
setRotationCenter
	| p |
	self world displayWorld.
	p := Cursor crossHair showWhile:
		[Sensor waitButton].
	Sensor waitNoButton.
	self setRotationCenterFrom: (self transformFromWorld globalPointToLocal: p).

