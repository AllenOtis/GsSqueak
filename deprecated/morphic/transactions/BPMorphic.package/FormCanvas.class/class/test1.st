testing
test1
	"FormCanvas test1"
	| _gsSqueakTemp_canvas |
	_gsSqueakTemp_canvas := FormCanvas extent: 200 @ 200.
	_gsSqueakTemp_canvas fillColor: Color black.
	_gsSqueakTemp_canvas
		line: 10 @ 10
		to: 50 @ 30
		width: 1
		color: Color red.
	_gsSqueakTemp_canvas
		frameRectangle: (20 @ 20 corner: 120 @ 120)
		width: 4
		color: Color green.
	_gsSqueakTemp_canvas point: 100 @ 100 color: Color black.
	_gsSqueakTemp_canvas
		drawString: 'Hello, World!'
		at: 40 @ 40
		font: nil
		color: Color cyan.
	_gsSqueakTemp_canvas
		fillRectangle: (10 @ 80 corner: 31 @ 121)
		color: Color magenta.
	_gsSqueakTemp_canvas
		fillOval: (10 @ 80 corner: 31 @ 121)
		color: Color cyan.
	_gsSqueakTemp_canvas
		frameOval: (40 @ 80 corner: 61 @ 121)
		color: Color blue.
	_gsSqueakTemp_canvas
		frameOval: (70 @ 80 corner: 91 @ 121)
		width: 3
		color: (Color red alpha: 0.2).
	_gsSqueakTemp_canvas
		fillRectangle: (130 @ 30 corner: 170 @ 80)
		color: Color lightYellow.
	_gsSqueakTemp_canvas showAt: 0 @ 0