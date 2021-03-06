menus
addHaloActionsTo: aMenu 
	"Add items to aMenu representing actions requestable via halo"
	| subMenu |
	subMenu := MenuMorph new defaultTarget: self.
	subMenu addTitle: self externalName.
	subMenu addStayUpItemSpecial.
	subMenu addLine.
	subMenu add: 'delete' translated action: #dismissViaHalo.
	subMenu balloonTextForLastItem: 'Delete this object -- warning -- can be destructive!' translated.
	self maybeAddCollapseItemTo: subMenu.
	subMenu add: 'grab' translated action: #openInHand.
	subMenu balloonTextForLastItem: 'Pick this object up -- warning, since this removes it from its container, it can have adverse effects.' translated.
	subMenu addLine.
	subMenu add: 'resize' translated action: #resizeFromMenu.
	subMenu balloonTextForLastItem: 'Change the size of this object' translated.
	subMenu add: 'duplicate' translated action: #maybeDuplicateMorph.
	subMenu balloonTextForLastItem: 'Hand me a copy of this object' translated.
	"Note that this allows access to the non-instancing duplicate even
	when this is a uniclass instance"
	self couldMakeSibling
		ifTrue: [subMenu add: 'make a sibling' translated action: #handUserASibling.
			subMenu balloonTextForLastItem: 'Make a new sibling of this object and hand it to me' translated].
	subMenu addLine.
	subMenu
		add: 'property sheet' translated
		target: self renderedMorph
		action: #openAPropertySheet.
	subMenu balloonTextForLastItem: 'Open a property sheet for me. Allows changing lots of stuff at once.' translated.
	subMenu
		add: 'set color' translated
		target: self renderedMorph
		action: #changeColor.
	subMenu balloonTextForLastItem: 'Change the color of this object' translated.
	subMenu
		add: 'viewer' translated
		target: self
		action: #beViewed.
	subMenu balloonTextForLastItem: 'Open a Viewer that will allow everything about this object to be seen and controlled.' translated.
	subMenu balloonTextForLastItem: 'Open a tool that will facilitate tile scripting of this object.' translated.
	subMenu
		add: 'hand me a tile' translated
		target: self
		action: #tearOffTile.
	subMenu balloonTextForLastItem: 'Hand me a tile represting this object' translated.
	subMenu addLine.
	subMenu
		add: 'inspect' translated
		target: self
		action: #inspect.
	subMenu balloonTextForLastItem: 'Open an Inspector on this object' translated.
	aMenu add: 'halo actions...' translated subMenu: subMenu