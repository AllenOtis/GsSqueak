accessing
defaultCanvasClass
  "Return the default canvas used for drawing onto the receiver"

  ^ (SessionTemps current at: #'Display') defaultCanvasClass