parsing-private
readNumberWithFractionPartNumberOfTrailingZeroInIntegerPart: numberOfTrailingZeroInIntegerPart
	"at this stage, sign integerPart and a decimal point have been read.
	try and form a number with a fractionPart"
	
	| numberOfNonZeroFractionDigits numberOfTrailingZeroInFractionPart mantissa value |
	fractionPart := self nextUnsignedIntegerOrNilBase: base.
	fractionPart
		ifNil:
			["No fractionPart found, but can be a 1.e2 syntax"
			fractionPart := 0.
			nDigits := 0.
			numberOfNonZeroFractionDigits := 0.
			numberOfTrailingZeroInFractionPart := 0]
		ifNotNil:
			[numberOfNonZeroFractionDigits := lastNonZero.
			numberOfTrailingZeroInFractionPart := nDigits - lastNonZero].
	self readExponent
		ifFalse: [(self readScaleWithDefaultNumberOfDigits: nDigits)
				ifTrue: [^self
					makeScaledDecimalWithNumberOfNonZeroFractionDigits: numberOfNonZeroFractionDigits
					andNumberOfTrailingZeroInFractionPart: numberOfTrailingZeroInFractionPart]].

	fractionPart isZero
		ifTrue:
			[mantissa := integerPart
						// (base raisedToInteger: numberOfTrailingZeroInIntegerPart).
			exponent := exponent + numberOfTrailingZeroInIntegerPart]
		ifFalse:
			[mantissa := integerPart
						* (base raisedToInteger: numberOfNonZeroFractionDigits)
						+ (fractionPart // (base raisedToInteger: numberOfTrailingZeroInFractionPart)).
			exponent := exponent - numberOfNonZeroFractionDigits].

	value := self makeFloatFromMantissa: mantissa exponent: exponent base: base.
	^ neg
		ifTrue: [value isZero
				ifTrue: [Float negativeZero]
				ifFalse: [value negated]]
		ifFalse: [value]