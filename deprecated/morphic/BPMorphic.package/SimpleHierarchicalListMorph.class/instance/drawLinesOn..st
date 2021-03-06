drawing
drawLinesOn: aCanvas 
	| _gsSqueakTemp_lColor |
	_gsSqueakTemp_lColor := self lineColor.
	aCanvas
		transformBy: scroller transform
		clippingTo: scroller innerBounds
		during: [:clippedCanvas | scroller
				submorphsDo: [:submorph | (submorph visible
							and: [(submorph isExpanded
										or: [clippedCanvas isVisible: submorph fullBounds])
									or: [submorph nextSibling notNil
											and: [clippedCanvas isVisible: submorph nextSibling fullBounds]]])
						ifTrue: [submorph
								drawLinesOn: clippedCanvas
								lineColor: _gsSqueakTemp_lColor
								indentThreshold: 0]]]
		smoothing: scroller smoothing