preferences
subPixelRenderFonts
	<preference: 'Subpixel font rendering' category: 'Graphics' description: 'If true, black fonts are rendered using subpixel combination rules by BitBlt.' type: #Boolean>
	^ SubPixelRenderFonts
		ifNil: [true]