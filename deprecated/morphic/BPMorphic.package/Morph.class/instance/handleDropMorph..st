events-processing
handleDropMorph: anEvent 
	"Handle a dropping morph."
	| aMorph localPt |
	anEvent wasHandled
		ifTrue: [^ self].
	"Not interested"
	aMorph := anEvent contents.
	"Do a symmetric check if both morphs like each other"
	((self wantsDroppedMorph: aMorph event: anEvent)
			and: ["I want her"
				aMorph wantsToBeDroppedInto: self])
		ifFalse: ["she wants me"
			aMorph removeProperty: #undoGrabCommand.
			^ self].
	anEvent wasHandled: true.
	"Transform the morph into the receiver's coordinate frame. This is
	currently incomplete since it only takes the offset into account where
	it really should take the entire transform."
	localPt := (self transformedFrom: anEvent hand world)
				globalPointToLocal: aMorph referencePosition.
	"full transform down"
	aMorph referencePosition: localPt.
	self acceptDroppingMorph: aMorph event: anEvent.
	aMorph justDroppedInto: self event: anEvent