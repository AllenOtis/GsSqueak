TODO
drawString: s from: firstIndex to: lastIndex in: boundsRect font: fontOrNil color: c 
	(self ifNoTransformWithIn: boundsRect)
		ifTrue: [^ super
				drawString: s
				from: firstIndex
				to: lastIndex
				in: boundsRect
				font: fontOrNil
				color: c]