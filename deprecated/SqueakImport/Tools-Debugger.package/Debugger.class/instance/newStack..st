private
newStack: stack
	| oldStack diff |
	oldStack := contextStack.
	contextStack := stack.
	(oldStack == nil or: [oldStack last ~~ stack last])
		ifTrue: [contextStackList := contextStack collect: [:ctx | ctx printString].
				^ self].
	"May be able to re-use some of previous list"
	diff := stack size - oldStack size.
	contextStackList := diff <= 0
		ifTrue: [contextStackList copyFrom: 1-diff to: oldStack size]
		ifFalse: [diff > 1
				ifTrue: [contextStack collect: [:ctx | ctx printString]]
				ifFalse: [(Array with: stack first printString) , contextStackList]]