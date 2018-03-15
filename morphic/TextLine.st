'From Squeak6.0alpha of 20 March 2017 [latest update: #17058] on 14 March 2018 at 4:25:26 pm'!
Transcript show: 'TextConstants'; cr!
Smalltalk at: #TextConstants put: Dictionary new!
TextConstants at: #'BS' put:  (Character backspace)!
TextConstants at: #'BS2' put:  ($�)!
TextConstants at: #'Basal' put:  0!
TextConstants at: #'Bold' put:  1!
TextConstants at: #'CR' put:  (Character cr)!

TextConstants at: #'Centered' put:  2!
TextConstants at: #'Clear' put:  ($�)!
TextConstants at: #'CrLf' put:  ('

')!
TextConstants at: #'CrLfCrLf' put:  ('



')!
TextConstants at: #'CrossedX' put:  258!
TextConstants at: #'CtlW' put:  ($�)!
TextConstants at: #'CtrlA' put:  ($�)!
TextConstants at: #'CtrlB' put:  ($�)!
TextConstants at: #'CtrlC' put:  ($�)!
TextConstants at: #'CtrlD' put:  ($�)!
TextConstants at: #'CtrlDigits' put:  (#(159 144 143 128 127 129 131 180 149 135))!
TextConstants at: #'CtrlE' put:  ($�)!
TextConstants at: #'CtrlF' put:  ($�)!
TextConstants at: #'CtrlG' put:  ($�)!
TextConstants at: #'CtrlH' put:  ($�)!
TextConstants at: #'CtrlI' put:  ($�)!
TextConstants at: #'CtrlJ' put:  ($�)!
TextConstants at: #'CtrlK' put:  ($�)!
TextConstants at: #'CtrlL' put:  ($�)!
TextConstants at: #'CtrlM' put:  ($�)!
TextConstants at: #'CtrlN' put:  ($�)!
TextConstants at: #'CtrlO' put:  ($�)!
TextConstants at: #'CtrlOpenBrackets' put:  (#(201 7 218 249 219 15))!
TextConstants at: #'CtrlP' put:  ($�)!
TextConstants at: #'CtrlQ' put:  ($�)!
TextConstants at: #'CtrlR' put:  ($�)!
TextConstants at: #'CtrlS' put:  ($�)!
TextConstants at: #'CtrlT' put:  ($�)!
TextConstants at: #'CtrlU' put:  ($�)!
TextConstants at: #'CtrlV' put:  ($�)!
TextConstants at: #'CtrlW' put:  ($�)!
TextConstants at: #'CtrlX' put:  ($�)!
TextConstants at: #'CtrlY' put:  ($�)!
TextConstants at: #'CtrlZ' put:  ($�)!
TextConstants at: #'Ctrla' put:  (Character value: 1)!
TextConstants at: #'Ctrlb' put:  ($�)!
TextConstants at: #'Ctrlc' put:  ($�)!
TextConstants at: #'Ctrld' put:  ($�)!
TextConstants at: #'Ctrle' put:  ($�)!
TextConstants at: #'Ctrlf' put:  (Character newPage)!
TextConstants at: #'Ctrlg' put:  ($�)!
TextConstants at: #'Ctrlh' put:  ($�)!
TextConstants at: #'Ctrli' put:  ($�)!
TextConstants at: #'Ctrlj' put:  ($�)!
TextConstants at: #'Ctrlk' put:  ($�)!
TextConstants at: #'Ctrll' put:  ($�)!
TextConstants at: #'Ctrlm' put:  ($�)!
TextConstants at: #'Ctrln' put:  (Character value: 14)!
TextConstants at: #'Ctrlo' put:  (Character value: 15)!
TextConstants at: #'Ctrlp' put:  ($�)!
TextConstants at: #'Ctrlq' put:  (Character value: 17)!
TextConstants at: #'Ctrlr' put:  (Character value: 18)!
TextConstants at: #'Ctrls' put:  (Character value: 19)!
TextConstants at: #'Ctrlt' put:  (Character value: 11)!
TextConstants at: #'Ctrlu' put:  (Character value: 21)!
TextConstants at: #'Ctrlv' put:  ($�)!
TextConstants at: #'Ctrlw' put:  ($�)!
TextConstants at: #'Ctrlx' put:  ($�)!
TextConstants at: #'Ctrly' put:  ($�)!
TextConstants at: #'Ctrlz' put:  ($�)!
TextConstants at: #'DefaultBaseline' put:  12!
TextConstants at: #'DefaultEditMenuMessages' put:  (#(#again #copySelection #cut #paste #undo #save #cancel #align #fit))!
TextConstants at: #'DefaultFontFamilySize' put:  3!
TextConstants at: #'DefaultLineGrid' put:  16!
TextConstants at: #'DefaultMarginTabsArray' put:  (#(#(24 24) #(48 48) #(72 72) #(96 96) #(120 120) #(144 144) #(168 168) #(192 192) #(216 216) #(240 240) #(264 264) #(288 288) #(312 312) #(336 336) #(360 360)))!
TextConstants at: #'DefaultMask' put:  (Color black)!
TextConstants at: #'DefaultMultiStyle' put:  TextStyle default!
TextConstants at: #'DefaultRule' put:  3!
TextConstants at: #'DefaultSpace' put:  4!
TextConstants at: #'DefaultTab' put:  24!
TextConstants at: #'DefaultTabsArray' put:  (#(24 48 72 96 120 144 168 192 216 240 264 288 312 336 360 384 408 432 456 480 504 528 552 576 600 624 648 672 696 720))!
TextConstants at: #'ESC' put:  ($�)!
TextConstants at: #'EndOfRun' put:  257!
TextConstants at: #'Enter' put:  (Character value: 3)!
TextConstants at: #'Italic' put:  2!
TextConstants at: #'Justified' put:  3!
TextConstants at: #'LeftFlush' put:  0!
TextConstants at: #'LeftMarginTab' put:  1!
TextConstants at: #'RightFlush' put:  1!
TextConstants at: #'RightMarginTab' put:  2!
TextConstants at: #'Space' put:  (Character space)!


Object subclass: #TextLine
	instanceVariableNames: 'left right top bottom firstIndex lastIndex internalSpaces paddingWidth baseline leftMargin'
	classVariableNames: ''
	poolDictionaries: 'TextConstants'
	category: 'Graphics-Text'!
!TextLine commentStamp: '<historical>' prior: 0!
A TextLine embodies the layout of a line of composed text.
	left right top bottom		The full line rectangle
	firstIndex lastIndex		Starting and stopping indices in the full text
	internalSpaces		Number of spaces to share paddingWidth
	paddingWidth		Number of pixels of extra space in full line
	baseline				Distance of baseline below the top of the line
	leftMargin			Left margin due to paragraph indentation
TextLine's rather verbose message protocol is required for compatibility with the old CharacterScanners.!


!TextLine methodsFor: '*Etoys-Squeakland-scanning'!
justifiedPadFor: spaceIndex 
	"Compute the width of pad for a given space in a line of justified text."
	| _gsSqueakTemp_pad |
	internalSpaces = 0
		ifTrue: [^ 0].
	_gsSqueakTemp_pad := paddingWidth // internalSpaces.
	spaceIndex <= (paddingWidth \\ internalSpaces)
		ifTrue: [^ _gsSqueakTemp_pad + 1]
		ifFalse: [^ _gsSqueakTemp_pad]! !


!TextLine methodsFor: 'accessing'!
baseline
	^ baseline! !

!TextLine methodsFor: 'accessing' stamp: 'di 10/23/97 19:58'!
bottom
	^ bottom! !

!TextLine methodsFor: 'accessing' stamp: 'di 10/23/97 19:58'!
bottomRight
	^ right @ bottom! !

!TextLine methodsFor: 'accessing' stamp: 'di 10/21/97 20:12'!
first
	^ firstIndex! !

!TextLine methodsFor: 'accessing'!
internalSpaces
	"Answer the number of spaces in the line."
	^ internalSpaces! !

!TextLine methodsFor: 'accessing'!
internalSpaces: spacesInteger 
	"Set the number of spaces in the line to be spacesInteger."
	internalSpaces := spacesInteger! !

!TextLine methodsFor: 'accessing' stamp: 'di 10/21/97 20:14'!
last
	^ lastIndex! !

!TextLine methodsFor: 'accessing' stamp: 'di 10/23/97 19:58'!
left
	^ left! !

!TextLine methodsFor: 'accessing' stamp: 'di 10/21/97 20:42'!
leftMargin
	"This has to get fixed -- store during composition"
	^ self left! !

!TextLine methodsFor: 'accessing' stamp: 'hmm 2/9/2001 11:58'!
leftMargin: lm 
	left := lm! !

!TextLine methodsFor: 'accessing' stamp: 'nice 3/6/2008 22:44'!
leftMarginForAlignment: alignmentCode 
	alignmentCode = RightFlush
		ifTrue: [^ self left + paddingWidth].
	alignmentCode = Centered
		ifTrue: [^ self left + (paddingWidth // 2)].
	^ self left"leftFlush and justified"! !

!TextLine methodsFor: 'accessing' stamp: 'di 10/23/97 19:58'!
lineHeight
	^ bottom - top! !

!TextLine methodsFor: 'accessing'!
paddingWidth
	"Answer the amount of space to be added to the font."
	^ paddingWidth! !

!TextLine methodsFor: 'accessing'!
paddingWidth: padWidthInteger 
	"Set the amount of space to be added to the font to be
	padWidthInteger. "
	paddingWidth := padWidthInteger! !

!TextLine methodsFor: 'accessing' stamp: 'di 10/23/97 20:00'!
rectangle
	^ self topLeft corner: self bottomRight! !

!TextLine methodsFor: 'accessing' stamp: 'hmm 2/9/2001 11:58'!
rectangle: lineRectangle 
	left := lineRectangle left.
	right := lineRectangle right.
	top := lineRectangle top.
	bottom := lineRectangle bottom! !

!TextLine methodsFor: 'accessing' stamp: 'di 10/23/97 19:58'!
right
	^ right! !

!TextLine methodsFor: 'accessing' stamp: 'di 10/21/97 20:42'!
rightMargin
	"This has to get fixed -- store during composition"
	^ self right! !

!TextLine methodsFor: 'accessing' stamp: 'di 11/26/97 16:18'!
setRight: x 
	right := x! !

!TextLine methodsFor: 'accessing' stamp: 'di 10/20/97 23:27'!
stop: stopInteger 
	"Set the stopping point in the string of the line to be stopInteger."
	lastIndex := stopInteger! !

!TextLine methodsFor: 'accessing' stamp: 'di 10/23/97 19:58'!
top
	^ top! !

!TextLine methodsFor: 'accessing' stamp: 'di 10/23/97 19:58'!
topLeft
	^ left @ top! !

!TextLine methodsFor: 'accessing' stamp: 'di 11/26/97 16:58'!
width
	^ right - left! !


!TextLine methodsFor: 'comparing' stamp: 'di 10/20/97 23:24'!
= line 
	self species = line species
		ifTrue: [^ ((firstIndex = line first
						and: [lastIndex = line last])
					and: [internalSpaces = line internalSpaces])
				and: [paddingWidth = line paddingWidth]]
		ifFalse: [^ false]! !

!TextLine methodsFor: 'comparing' stamp: 'ar 9/9/2003 22:03'!
hash
	"#hash is re-implemented because #= is re-implemented"
	^ firstIndex hash bitXor: lastIndex hash! !


!TextLine methodsFor: 'printing' stamp: 'di 10/23/97 23:19'!
printOn: aStream 
	super printOn: aStream.
	aStream space; print: firstIndex; nextPutAll: ' to: '; print: lastIndex! !


!TextLine methodsFor: 'scanning' stamp: 'tween 4/6/2007 12:48'!
justifiedPadFor: spaceIndex font: aFont 
	"Compute the width of pad for a given space in a line of justified text."
	| _gsSqueakTemp_pad |
	internalSpaces = 0
		ifTrue: [^ 0].
	^ (aFont notNil
			and: [aFont isSubPixelPositioned])
		ifTrue: [paddingWidth * 1.0 / internalSpaces]
		ifFalse: [_gsSqueakTemp_pad := paddingWidth // internalSpaces.
			spaceIndex <= (paddingWidth \\ internalSpaces)
				ifTrue: [_gsSqueakTemp_pad + 1]
				ifFalse: [_gsSqueakTemp_pad]]! !

!TextLine methodsFor: 'scanning'!
justifiedTabDeltaFor: spaceIndex 
	"Compute the delta for a tab in a line of justified text, so tab falls 
	somewhere plausible when line is justified."
	| _gsSqueakTemp_pad _gsSqueakTemp_extraPad |
	internalSpaces = 0
		ifTrue: [^ 0].
	_gsSqueakTemp_pad := paddingWidth // internalSpaces.
	_gsSqueakTemp_extraPad := paddingWidth \\ internalSpaces.
	spaceIndex <= _gsSqueakTemp_extraPad
		ifTrue: [^ spaceIndex * (_gsSqueakTemp_pad + 1)]
		ifFalse: [^ _gsSqueakTemp_extraPad * (_gsSqueakTemp_pad + 1) + (spaceIndex - _gsSqueakTemp_extraPad * _gsSqueakTemp_pad)]! !


!TextLine methodsFor: 'updating' stamp: 'di 11/7/97 08:32'!
moveBy: delta 
	"Move my rectangle by the given delta"
	left := left + delta x.
	right := right + delta x.
	top := top + delta y.
	bottom := bottom + delta y! !

!TextLine methodsFor: 'updating' stamp: 'di 10/20/97 23:25'!
slide: delta 
	"Change the starting and stopping points of the line by delta."
	firstIndex := firstIndex + delta.
	lastIndex := lastIndex + delta! !

!TextLine methodsFor: 'updating' stamp: 'di 4/28/1999 11:12'!
slideIndexBy: delta andMoveTopTo: newTop 
	"Relocate my character indices and y-values.
	Used to slide constant text up or down in the wake of a text
	replacement. "
	firstIndex := firstIndex + delta.
	lastIndex := lastIndex + delta.
	bottom := bottom + (newTop - top).
	top := newTop! !


!TextLine methodsFor: 'private' stamp: 'di 10/20/97 23:08'!
firstIndex: firstInteger lastIndex: lastInteger 
	firstIndex := firstInteger.
	lastIndex := lastInteger! !

!TextLine methodsFor: 'private'!
internalSpaces: spacesInteger paddingWidth: padWidthInteger 
	internalSpaces := spacesInteger.
	paddingWidth := padWidthInteger! !

!TextLine methodsFor: 'private' stamp: 'di 10/23/97 19:57'!
lineHeight: height baseline: ascent 
	bottom := top + height.
	baseline := ascent! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

TextLine class
	instanceVariableNames: ''!

!TextLine class methodsFor: 'instance creation' stamp: 'di 10/20/97 23:08'!
start: startInteger stop: stopInteger internalSpaces: spacesInteger paddingWidth: padWidthInteger 
	"Answer an instance of me with the arguments as the start, stop
	points, 
	number of spaces in the line, and width of the padding."
	| _gsSqueakTemp_line |
	_gsSqueakTemp_line := self new firstIndex: startInteger lastIndex: stopInteger.
	^ _gsSqueakTemp_line internalSpaces: spacesInteger paddingWidth: padWidthInteger! !