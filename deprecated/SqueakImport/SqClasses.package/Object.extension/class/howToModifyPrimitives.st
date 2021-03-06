*SqClasses-documentation
howToModifyPrimitives
	"You are allowed to write methods which specify primitives, but please use 
	caution.  If you make a subclass of a class which contains a primitive method, 
	the subclass inherits the primitive.  The message which is implemented 
	primitively may be overridden in the subclass (E.g., see at:put: in String's 
	subclass Symbol).  The primitive behavior can be invoked using super (see 
	Symbol string:). 
	 
	A class which attempts to mimic the behavior of another class without being 
	its subclass may or may not be able to use the primitives of the original class.  
	In general, if the instance variables read or written by a primitive have the 
	same meanings and are in the same fields in both classes, the primitive will 
	work.  

	For certain frequently used 'special selectors', the compiler emits a 
	send-special-selector bytecode instead of a send-message bytecode. Special 
	selectors were created because they offer two advantages.  First, code which
	sends special selectors compiles into fewer bytes than normal. Second, for
	some pairs of receiver classes and special selectors, the interpreter jumps
	directly to a primitive routine without looking up the method in the class,
	and the just-in-time (JIT) compiler (if in use) may emit code to directly execute
	the primitive.  At least in the interpeeter this is much faster than a normal
	message lookup. In both the interpreter and the JIT send-special-selector,
	conditional branch pairs are short-circuited for the comparison selectors.
	 
	A selector which is a special selector solely in order to save space has a 
	normal behavior.  Methods whose selectors are special in order to 
	gain speed contain the comment, 'No Lookup'.  When the interpreter 
	encounters a send-special-selector bytecode, it checks the class of the 
	receiver and the selector.  If the class-selector pair is a no-lookup pair, 
	then the interpreter swiftly jumps to the routine which implements the 
	corresponding primitive.  (A special selector whose receiver is not of the 
	right class to make a no-lookup pair, is looked up normally).  The pairs are 
	listed below.  No-lookup methods contain a primitive number specification, 
	<primitive: xx>, which is redundant.  Since the method is not normally looked 
	up, deleting the primitive number specification cannot prevent this 
	primitive from running.  If a no-lookup primitive fails, the method is looked 
	up normally, and the expressions in it are executed. 
	 
	No Lookup pairs of (class, selector) 

	SmallInteger and Float with any of	+ - * /
	SmallInteger with any of			\  bitOr: bitShift: bitAnd:  // @
	SmallInteger and Float with any of	=  ~=  >  <  >=  <= 
	Any class with						== ~~ class
	Point with either of					x y				(interpreter only)
	BlockClosure with either of 			value value:	(interpreter only)
	"

	self error: 'comment only'
