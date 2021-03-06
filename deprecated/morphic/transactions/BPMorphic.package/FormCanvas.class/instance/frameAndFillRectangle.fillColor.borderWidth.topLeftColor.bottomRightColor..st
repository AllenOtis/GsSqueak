drawing-rectangles
frameAndFillRectangle: r fillColor: fillColor borderWidth: borderWidth topLeftColor: topLeftColor bottomRightColor: bottomRightColor 
	"First use quick code for top and left borders and fill"
	| _gsSqueakTemp_w _gsSqueakTemp_h _gsSqueakTemp_rect |
	self
		frameAndFillRectangle: r
		fillColor: fillColor
		borderWidth: borderWidth
		borderColor: topLeftColor.
	"Now use slow code for bevelled bottom and right borders"
	bottomRightColor isTransparent
		ifFalse: [borderWidth isNumber
				ifTrue: [_gsSqueakTemp_w := _gsSqueakTemp_h := borderWidth]
				ifFalse: [_gsSqueakTemp_w := borderWidth x.
					_gsSqueakTemp_h := borderWidth y].
			_gsSqueakTemp_rect := r translateBy: origin.
			self setFillColor: bottomRightColor.
			port frameRectRight: _gsSqueakTemp_rect width: _gsSqueakTemp_w;
				 frameRectBottom: _gsSqueakTemp_rect height: _gsSqueakTemp_h]