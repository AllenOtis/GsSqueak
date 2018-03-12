toolbuilder
buildWith: builder

	| max windowSpec |
	max := 0.42.
	windowSpec := self buildWindowWith: builder specs: {
		(0@0 corner: 0.2@max) -> [self buildSymbolDictionaryListWith: builder].
		(0.2@0 corner: 0.4@max) -> [self buildSystemCategoryListWith: builder].
		(self classListFrame: max) -> [self buildClassListWith: builder].
		"(self switchesFrame: max) -> [self buildSwitchesWith: builder]."
		(0.6@0 corner: 0.8@max) -> [self buildMessageCategoryListWith: builder].
		(0.8@0 corner: 1@max) -> [self buildMessageListWith: builder].
		(0@max corner: 1@1) -> [self buildCodePaneWith: builder].
	}.
	
	^ builder build: windowSpec