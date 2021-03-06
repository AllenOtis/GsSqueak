objects from disk
saveOnFile
	"Ask the user for a filename and save myself on a
	SmartReferenceStream file. Writes out the version and class
	structure. The file is fileIn-able. UniClasses will be filed out."
	| aFileName fileStream ok |
	self flag: #bob0302.
	self isWorldMorph
		ifTrue: [^ self project saveAs].
	aFileName := ('my {1}' translated format: {self class name}) asFileName.
	"do better?"
	aFileName := UIManager default request: 'File name? (".project" will be added to end)' translated initialAnswer: aFileName.
	aFileName isEmpty
		ifTrue: [^ Beeper beep].
	self
		allMorphsDo: [:m | m prepareToBeSaved].
	ok := aFileName endsWith: '.project'.
	"don't double them"
	ok := ok
				| (aFileName endsWith: '.sp').
	ok
		ifFalse: [aFileName := aFileName , '.project'].
	fileStream := FileStream newFileNamed: aFileName asFileName.
	fileStream fileOutClass: nil andObject: self