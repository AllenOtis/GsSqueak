class initialization
initialize
    "Dictionary is nil on GsSqueak bootstrap. initialize it"
    self initializeDictionaryOfPreferences.
    
	"Preferences initialize"
	self registerForEvents.