Class {
	#name : #MWMagickWandLibrary,
	#superclass : #FFILibrary,
	#category : #MagickWand
}

{ #category : #initialization }
MWMagickWandLibrary class >> reset [
	<script>
	uniqueInstance := nil
]

{ #category : #'magick wand methods' }
MWMagickWandLibrary >> isMagickWandInstantiated [
	^ self ffiCall: 'Boolean IsMagickWandInstantiated(void)'
]

{ #category : #'magick image' }
MWMagickWandLibrary >> magick: aMagickWand getImageBlobOfSize: length [
	^ self ffiCall: 'uchar * MagickGetImagesBlob(void * aMagickWand, size_t * length)'
]

{ #category : #'magick image' }
MWMagickWandLibrary >> magick: aMagickWand readImage: filename [
	^ self ffiCall: 'Boolean MagickReadImage(void * aMagickWand, String filename)'
]

{ #category : #'magick image' }
MWMagickWandLibrary >> magick: aMagickWand setImageFormat: format [
	^ self ffiCall: 'Boolean MagickSetImageFormat(void * aMagickWand, String format)'
]

{ #category : #'magick wand methods' }
MWMagickWandLibrary >> magickResetIterator: wand [
	^ self ffiCall: 'void MagickResetIterator(void * wand)'
]

{ #category : #'magick wand methods' }
MWMagickWandLibrary >> magickSetFirstIterator: wand [
	^ self ffiCall: 'void MagickSetFirstIterator(void  *wand)'
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
	^ self ffiCall: 'void * NewMagickWand()'
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
