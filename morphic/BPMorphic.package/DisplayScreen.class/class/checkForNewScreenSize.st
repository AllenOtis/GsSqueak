display box access
checkForNewScreenSize
  "Check whether the screen size has changed and if so take appropriate
	actions "

  (Smalltalk at: #'Display') extent = DisplayScreen actualScreenSize
    ifFalse: [ Display restore ]