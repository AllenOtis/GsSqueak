process primitives
primitiveSuspend
	"Primitive. Suspend the receiver, aProcess such that it can be executed again
	by sending #resume. If the given process is not currently running, take it off
	its corresponding list. The primitive returns the list the receiver was previously on."

	| process activeProc myList |
	process := self stackTop.
	activeProc := objectMemory fetchPointer: ActiveProcessIndex
						 ofObject: self schedulerPointer.
	process == activeProc ifTrue:[
		self pop: 1.
		self push: objectMemory getNilObj.
		self transferTo: self wakeHighestPriority.
	] ifFalse:[
		myList := objectMemory fetchPointer: MyListIndex ofObject: process.
		"XXXX Fixme. We should really check whether myList is a kind of LinkedList or not
		but we can't easily so just do a quick check for nil which is the most common case."
		myList == objectMemory getNilObj ifTrue:[^self primitiveFail].
		self removeProcess: process fromList: myList.
		self successful ifTrue:[
			objectMemory storePointer: MyListIndex ofObject: process withValue: objectMemory getNilObj.
			self pop: 1.
			self push: myList.
		].
	].
