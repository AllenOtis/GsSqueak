access
saturation
	"Return the saturation of this color, a value between 0.0 and 1.0."
	| _gsSqueakTemp_r _gsSqueakTemp_g _gsSqueakTemp_b _gsSqueakTemp_max _gsSqueakTemp_min |
	_gsSqueakTemp_r := self privateRed.
	_gsSqueakTemp_g := self privateGreen.
	_gsSqueakTemp_b := self privateBlue.
	_gsSqueakTemp_max := _gsSqueakTemp_min := _gsSqueakTemp_r.
	_gsSqueakTemp_g > _gsSqueakTemp_max
		ifTrue: [_gsSqueakTemp_max := _gsSqueakTemp_g].
	_gsSqueakTemp_b > _gsSqueakTemp_max
		ifTrue: [_gsSqueakTemp_max := _gsSqueakTemp_b].
	_gsSqueakTemp_g < _gsSqueakTemp_min
		ifTrue: [_gsSqueakTemp_min := _gsSqueakTemp_g].
	_gsSqueakTemp_b < _gsSqueakTemp_min
		ifTrue: [_gsSqueakTemp_min := _gsSqueakTemp_b].
	_gsSqueakTemp_max = 0
		ifTrue: [^ 0.0]
		ifFalse: [^ (_gsSqueakTemp_max - _gsSqueakTemp_min) asFloat / _gsSqueakTemp_max asFloat]