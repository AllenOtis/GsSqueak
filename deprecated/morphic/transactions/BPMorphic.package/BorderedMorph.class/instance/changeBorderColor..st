menu
changeBorderColor: evt 
	| aHand |
	aHand := evt
				ifNil: [self primaryHand]
				ifNotNil: [evt hand].
	self
		changeColorTarget: self
		selector: #borderColor:
		originalColor: self borderColor
		hand: aHand