class initialization
initializeGrayToIndexMap
	"Build an array of gray values available in the 8-bit colormap. This array
	is indexed by a gray level between black (1) and white (256) and
	returns the pixel value for the corresponding gray level."
	"Note: This method must be called after initializeIndexedColors, since it
	uses IndexedColors."
	"Color initializeGrayToIndexMap"
	"record the level and index of each gray in the 8-bit color table"
	| _gsSqueakTemp_grayLevels _gsSqueakTemp_grayIndices _gsSqueakTemp_c _gsSqueakTemp_distToClosest _gsSqueakTemp_dist _gsSqueakTemp_indexOfClosest |
	_gsSqueakTemp_grayLevels := OrderedCollection new.
	_gsSqueakTemp_grayIndices := OrderedCollection new.
	"Note: skip the first entry, which is reserved for transparent"
	2
		to: IndexedColors size
		do: [:i | 
			_gsSqueakTemp_c := IndexedColors at: i.
			_gsSqueakTemp_c saturation = 0.0
				ifTrue: ["c is a gray"
					_gsSqueakTemp_grayLevels add: _gsSqueakTemp_c privateBlue >> 2.
					"top 8 bits; R, G, and B are the same"
					_gsSqueakTemp_grayIndices add: i - 1]].
	"pixel values are zero-based"
	_gsSqueakTemp_grayLevels := _gsSqueakTemp_grayLevels asArray.
	_gsSqueakTemp_grayIndices := _gsSqueakTemp_grayIndices asArray.
	"for each gray level in [0..255], select the closest match"
	GrayToIndexMap := ByteArray new: 256.
	0
		to: 255
		do: [:level | 
			_gsSqueakTemp_distToClosest := 10000.
			"greater than distance to any real gray"
			1
				to: _gsSqueakTemp_grayLevels size
				do: [:i | 
					_gsSqueakTemp_dist := (level
								- (_gsSqueakTemp_grayLevels at: i)) abs.
					_gsSqueakTemp_dist < _gsSqueakTemp_distToClosest
						ifTrue: [_gsSqueakTemp_distToClosest := _gsSqueakTemp_dist.
							_gsSqueakTemp_indexOfClosest := _gsSqueakTemp_grayIndices at: i]].
			GrayToIndexMap at: level + 1 put: _gsSqueakTemp_indexOfClosest]