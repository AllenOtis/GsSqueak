as yet unclassified
loadClass: aClassSpec
  | rwStream |
  rwStream := RWBinaryOrTextStream on: aClassSpec.
  [ rwStream fileIn ]
    on: CompileError
    do: [ :sig | 
      | err |
      err := sig gsArguments first.
      (err first at: 3) = 'undefined symbol'
        ifTrue: [ 
          (GsConfirmInteraction
            prompt: 'missing superclass: ' , (err first at: 5)
            confirm: 'Load') signal
            ifTrue: [ 
              self importClass: (err first at: 5) asSymbol.
              self loadClass: aClassSpec ] ] ]