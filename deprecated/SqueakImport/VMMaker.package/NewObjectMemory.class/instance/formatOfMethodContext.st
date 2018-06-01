frame access
formatOfMethodContext
	"Answer the class format word for MethodContext which is used to instantiate
	 contexts without needing to fetch it from the class MethodContext itself."
	^(ClassMethodContextCompactIndex << 12)
	+ (3 << 8) "Pointers+Variable"
	+ (CtxtTempFrameStart + (self baseHeaderSize / self bytesPerWord) << 2)