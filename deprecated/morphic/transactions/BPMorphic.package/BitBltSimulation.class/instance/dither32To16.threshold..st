pixel mapping
dither32To16: srcWord threshold: ditherValue 
	"Dither the given 32bit word to 16 bit. Ignore alpha."
	| _gsSqueakTemp_addThreshold |
	<inline: true>
	"You bet"
	_gsSqueakTemp_addThreshold := ditherValue bitShift: 8.
	^ ((dither8Lookup at: _gsSqueakTemp_addThreshold
			+ ((srcWord bitShift: -16)
					bitAnd: 255))
		bitShift: 10)
		+ ((dither8Lookup at: _gsSqueakTemp_addThreshold
					+ ((srcWord bitShift: -8)
							bitAnd: 255))
				bitShift: 5)
		+ (dither8Lookup at: _gsSqueakTemp_addThreshold
					+ (srcWord bitAnd: 255))