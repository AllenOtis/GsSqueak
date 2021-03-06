meta-actions
sightTargets: event
  "Return the potential targets for the receiver. 
	This is derived from Morph>>potentialEmbeddingTargets."

  | bullseye candidates choice |
  self owner ifNil: [ ^ #() ].
  bullseye := Point fromUserWithCursor: Cursor target.
  candidates := self potentialTargetsAt: bullseye.
  choice := UIManager default
    chooseFrom:
      (candidates collect: [ :m | m knownName ifNil: [ m class name ] ])
    values: candidates.
  choice ifNotNil: [ self target: choice ]