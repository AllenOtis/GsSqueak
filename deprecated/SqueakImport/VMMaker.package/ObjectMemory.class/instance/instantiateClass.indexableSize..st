interpreter access
instantiateClass: classPointer indexableSize: size 
	"NOTE: This method supports the backward-compatible split instSize field of the 
	class format word. The sizeHiBits will go away and other shifts change by 2 
	when the split fields get merged in an (incompatible) image change."

	| hash header1 header2 cClass byteSize format binc header3 hdrSize fillWord newObj sizeHiBits bm1 classFormat |
	<inline: false>
	DoAssertionChecks ifTrue: [size < 0
				ifTrue: [self error: 'cannot have a negative indexable field count']].
	hash := self newObjectHash.
	classFormat := self formatOfClass: classPointer.
	"Low 2 bits are 0"
	header1 := (classFormat bitAnd: 16r1FF00) bitOr: (hash << HashBitsOffset bitAnd: HashBits).
	header2 := classPointer.
	header3 := 0.
	sizeHiBits := (classFormat bitAnd: 16r60000) >> 9.
	cClass := header1 bitAnd: CompactClassMask. "compact class field from format word"
	byteSize := (classFormat bitAnd: self sizeMask + self size4Bit) + sizeHiBits.
		"size in bytes -- low 2 bits are 0"
	"Note this byteSize comes from the format word of the class which is pre-shifted
		to 4 bytes per field.  Need another shift for 8 bytes per word..."
	byteSize := byteSize << (self shiftForWord - 2).
	format := classFormat >> 8 bitAnd: 15.
	self flag: #sizeLowBits.
	format < 8
		ifTrue:
			[format = 6
				ifTrue: ["long32 bitmaps"
					bm1 := self bytesPerWord - 1.
					byteSize := byteSize + (size * 4) + bm1 bitAnd: self longSizeMask. "round up"
					binc := bm1 - ((size * 4) + bm1 bitAnd: bm1). "odd bytes"
					"extra low bit (4) for 64-bit VM goes in 4-bit (betw hdr bits and sizeBits)"
					header1 := header1 bitOr: (binc bitAnd: 4)]
				ifFalse: [byteSize := byteSize + (size * self bytesPerWord) "Arrays and 64-bit bitmaps"]
			]
		ifFalse:
			["Strings and Methods"
			bm1 := self bytesPerWord - 1.
			byteSize := byteSize + size + bm1 bitAnd: self longSizeMask. "round up"
			binc := bm1 - (size + bm1 bitAnd: bm1). "odd bytes"
			"low bits of byte size go in format field"
			header1 := header1 bitOr: (binc bitAnd: 3) << 8.
			"extra low bit (4) for 64-bit VM goes in 4-bit (betw hdr bits and sizeBits)"
			header1 := header1 bitOr: (binc bitAnd: 4)].
	byteSize > 255
		ifTrue: ["requires size header word"
			header3 := byteSize.
			header1 := header1]
		ifFalse: [header1 := header1 bitOr: byteSize].
	header3 > 0
		ifTrue: ["requires full header"
			hdrSize := 3]
		ifFalse: [cClass = 0
				ifTrue: [hdrSize := 2]
				ifFalse: [hdrSize := 1]].
	format <= 4
		ifTrue: ["if pointers, fill with nil oop"
			fillWord := nilObj]
		ifFalse: [fillWord := 0].
	newObj := self allocate: byteSize headerSize: hdrSize h1: header1 h2: header2 h3: header3 doFill: true with: fillWord.
	^ newObj