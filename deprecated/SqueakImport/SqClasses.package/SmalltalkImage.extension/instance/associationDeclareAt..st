*SqClasses-*SqClasses-*SqClasses-dictionary access
associationDeclareAt: aKey
	"DO NOT DEPRECATE - used by ImageSegments"
	self flag: #environments.
	^globals associationDeclareAt: aKey
