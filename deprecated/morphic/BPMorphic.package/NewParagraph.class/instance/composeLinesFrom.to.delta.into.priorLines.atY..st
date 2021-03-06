composition
composeLinesFrom: start to: stop delta: delta into: lineColl priorLines: priorLines atY: startingY 
	"While the section from start to stop has changed, composition may
	ripple all the way to the end of the text. However in a rectangular
	container, if we ever find a line beginning with the same character as
	before (ie corresponding to delta in the old lines), then we can just
	copy the old lines from there to the end of the container, with
	adjusted indices and y-values"
	| _gsSqueakTemp_newResult |
	_gsSqueakTemp_newResult := TextComposer new
				composeLinesFrom: start
				to: stop
				delta: delta
				into: lineColl
				priorLines: priorLines
				atY: startingY
				textStyle: textStyle
				text: text
				container: container
				wantsColumnBreaks: wantsColumnBreaks == true.
	lines := _gsSqueakTemp_newResult first asArray.
	maxRightX := _gsSqueakTemp_newResult second.
	^ maxRightX