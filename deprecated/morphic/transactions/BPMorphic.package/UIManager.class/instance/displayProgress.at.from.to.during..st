ui requests
displayProgress: titleString at: aPoint from: minVal to: maxVal during: workBlock 
	"Display titleString as a caption over a progress bar while workBlock is
	evaluated. "
	^ self subclassResponsibility