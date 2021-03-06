other
maskingMap: depth 
	"Return a color map that maps all colors except transparent to words
	of all ones. Used to create a mask for a Form whose transparent pixel
	value is zero. Cache the most recently used map."
	| _gsSqueakTemp_sizeNeeded |
	depth <= 8
		ifTrue: [_gsSqueakTemp_sizeNeeded := 1 bitShift: depth]
		ifFalse: [_gsSqueakTemp_sizeNeeded := 4096].
	(MaskingMap == nil
			or: [MaskingMap size ~= _gsSqueakTemp_sizeNeeded])
		ifTrue: [MaskingMap := Bitmap new: _gsSqueakTemp_sizeNeeded withAll: 4294967295.
			MaskingMap at: 1 put: 0].
	^ MaskingMap