geometry
minWidth
	"The minimum extent is that of 2 or 3 buttons in a row or column,
	the 'up' and 'down' button and optionally the 'menu' button."
	| _gsSqueakTemp_buttonCount _gsSqueakTemp_refExtent _gsSqueakTemp_refBorder |
	_gsSqueakTemp_refExtent := upButton minExtent.
	_gsSqueakTemp_refBorder := upButton borderWidth.
	_gsSqueakTemp_buttonCount := {upButton visible. downButton visible. self menuButton visible}
				count: [:ea | ea].
	^ self orientation == #horizontal
		ifTrue: [super minWidth max: _gsSqueakTemp_buttonCount * _gsSqueakTemp_refExtent x - (_gsSqueakTemp_buttonCount - 1 * _gsSqueakTemp_refBorder)]
		ifFalse: [super minWidth max: 5]