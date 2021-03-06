initialization
standardPalette
	"Answer a standard palette forced by some level of enclosing
	presenter, or nil if none"
	| aPresenter |
	(aPresenter := self presenter)
		ifNil: [^ nil].
	^ aPresenter ownStandardPalette
		ifNil: [aPresenter associatedMorph owner
				ifNotNil: [:itsOwner | itsOwner standardPalette]]
		ifNotNil: [:pal | pal]