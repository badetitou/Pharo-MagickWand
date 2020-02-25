Class {
	#name : #MWMagickWandLibrary,
	#superclass : #FFILibrary,
	#category : #'MagickWand-Library'
}

{ #category : #initialization }
MWMagickWandLibrary class >> reset [
	<script>
	uniqueInstance := nil
]

{ #category : #'magick wand methods' }
MWMagickWandLibrary >> clearMagickWand: aMagickWand [
	^ self ffiCall: 'void ClearMagickWand(MWMagickWand * aMagickWand)'
]

{ #category : #'magick wand methods' }
MWMagickWandLibrary >> isMagickWandInstantiated [
	^ self ffiCall: 'Boolean IsMagickWandInstantiated(void)'
]

{ #category : #'magick wand methods' }
MWMagickWandLibrary >> magick: aMagickWand getException: severity [
	^ self ffiCall: 'char * MagickGetException(MWMagickWand * aMagickWand,void * severity)'
]

{ #category : #'magick image' }
MWMagickWandLibrary >> magick: aMagickWand getImageBlobOfSize: length [
	^ self ffiCall: 'uchar * MagickGetImageBlob(MWMagickWand * aMagickWand, size_t * length)'
]

{ #category : #'magick image' }
MWMagickWandLibrary >> magick: aMagickWand getImagesBlobOfSize: length [
	^ self ffiCall: 'String MagickGetImagesBlob(MWMagickWand * aMagickWand, size_t * length)'
]

{ #category : #'magick image' }
MWMagickWandLibrary >> magick: aMagickWand readImage: filename [
	^ self ffiCall: 'Boolean MagickReadImage(MWMagickWand * aMagickWand, String filename)'
]

{ #category : #'magick image' }
MWMagickWandLibrary >> magick: aMagickWand setImageFormat: format [
	^ self ffiCall: 'Boolean MagickSetImageFormat(MWMagickWand * aMagickWand, String format)'
]

{ #category : #'magick image' }
MWMagickWandLibrary >> magick: aMagickWand writeImage: filename [
	^ self ffiCall: 'Boolean MagickWriteImage(MWMagickWand * aMagickWand, String filename)'
]

{ #category : #'magick wand methods' }
MWMagickWandLibrary >> magickClearException: aMagickWand [
	^ self ffiCall: 'Boolean MagickClearException(MWMagickWand * aMagickWand)'
]

{ #category : #'magick wand methods' }
MWMagickWandLibrary >> magickGetExceptionType: aMagickWand [
	^ self ffiCall: 'void * MagickGetExceptionType(MagickWand * aMagickWand)'
]

{ #category : #'magick image' }
MWMagickWandLibrary >> magickGetImageFilename: aMagickWand [
	^ self ffiCall: 'String MagickGetImageFilename(MWMagickWand * aMagickWand)'
]

{ #category : #'magick image' }
MWMagickWandLibrary >> magickGetImageFormat: aMagickWand [
	^ self ffiCall: 'String MagickGetImageFormat(MWMagickWand * aMagickWand)'
]

{ #category : #'magick image' }
MWMagickWandLibrary >> magickGetImageHeight: aMagickWand [
	^ self ffiCall: 'size_t MagickGetImageHeight(MWMagickWand * aMagickWand)'
]

{ #category : #'magick image' }
MWMagickWandLibrary >> magickGetImageWidth: aMagickWand [
	^ self ffiCall: 'size_t MagickGetImageWidth(MWMagickWand * aMagickWand)'
]

{ #category : #'magick wand methods' }
MWMagickWandLibrary >> magickResetIterator: wand [
	^ self ffiCall: 'void MagickResetIterator(MWMagickWand * wand)'
]

{ #category : #'magick wand methods' }
MWMagickWandLibrary >> magickSetFirstIterator: wand [
	^ self ffiCall: 'void MagickSetFirstIterator(MWMagickWand * wand)'
]

{ #category : #'magick wand methods' }
MWMagickWandLibrary >> magickWandGenesis [
	^ self ffiCall: 'void MagickWandGenesis(void)'
]

{ #category : #'magick wand methods' }
MWMagickWandLibrary >> magickWandTerminus [
	^ self ffiCall: 'void MagickWandTerminus(void)'
]

{ #category : #'magick wand methods' }
MWMagickWandLibrary >> newMagickWand [
	^ self ffiCall: 'MWMagickWand * NewMagickWand()'
]

{ #category : #'accessing platform' }
MWMagickWandLibrary >> unix64LibraryName [
	#('/usr/lib/i386-linux-gnu' '/usr/lib32' '/usr/lib') , ((OSEnvironment current at: 'LD_LIBRARY_PATH' ifAbsent: [ '' ]) substrings: ':')
		do: [ :path | 
			| libraryPath |
			libraryPath := path asFileReference / 'libMagickWand-7.Q16HDRI.so'.
			libraryPath exists ifTrue: [ ^ libraryPath fullName ] ].
	self error: 'Cannot locate vlc library. Please check if it installed on your system'
]
