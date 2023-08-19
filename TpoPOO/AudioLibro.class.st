Class {
	#name : #AudioLibro,
	#superclass : #Libro,
	#category : #'TpoPOO-Modelo'
}

{ #category : #'as yet unclassified' }
AudioLibro >> getInfo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|info|
	info := super getInfo.
	^ (info , ' tipo:audioLibro')
]

{ #category : #'as yet unclassified' }
AudioLibro >> getTipo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| temporary variable names |
	^'audioLibro'
]
