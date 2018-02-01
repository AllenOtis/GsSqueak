copying
copyBits
  "Override copybits to do translucency if desired"

  (combinationRule >= 30 and: [ combinationRule <= 31 ])
    ifTrue: [ self copyBitsTranslucent: (alpha ifNil: [ 255 ]) ]
    ifFalse: [ 
      "Change later"
      "Primitive. Perform the movement of bits from the source form to the 
	destination form. Fail if any variables are not of the right type
	(Integer, 
	Float, or Form) or if the combination rule is not implemented. 
	In addition to the original 16 combination rules, this BitBlt supports
	16	fail (to simulate paint)
	17	fail (to simulate mask)
	18	sourceWord + destinationWord
	19	sourceWord - destinationWord
	20	rgbAdd: sourceWord with: destinationWord
	21	rgbSub: sourceWord with: destinationWord
	22	rgbDiff: sourceWord with: destinationWord
	23	tallyIntoMap: destinationWord
	24	alphaBlend: sourceWord with: destinationWord
	25	pixPaint: sourceWord with: destinationWord
	26	pixMask: sourceWord with: destinationWord
	27	rgbMax: sourceWord with: destinationWord
	28	rgbMin: sourceWord with: destinationWord
	29	rgbMin: sourceWord bitInvert32 with: destinationWor
	"
      "Check for compressed source, destination or halftone forms"
      0 to: height - 1 do: [ :y | 
        0 to: width - 1 do: [ :x | 
          destForm
            pixelValueAt: (x + destX) @ (y + destY)
            put:
              (combinationRule = 3
                ifTrue: [ fillPattern privateRGB ]
                ifFalse: [ sourceForm pixelValueAt: (x + sourceX) @ (y + sourceY) ]) ] ]	"self copyBitsSimulated"	"  0 to: 15 do: [ :row | 
    0 to: 15 do: [ :col | 
      destForm bits
        at: row * 640 + col + 1
        put: (sourceForm bits at: row * 16 + col + 1) ] ]" ]