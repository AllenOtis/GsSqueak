accessing
highlightColor
	^ (self valueOfProperty: #highlightColor)
		ifNil: [owner
				ifNil: [self color]
				ifNotNil: [owner highlightColor]]
		ifNotNil: [:val | val
				ifNil: [self error: 'nil highlightColor']]