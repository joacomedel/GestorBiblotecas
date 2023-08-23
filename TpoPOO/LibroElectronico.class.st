Class {
	#name : #LibroElectronico,
	#superclass : #Libro,
	#category : #'TpoPOO-Modelo'
}

{ #category : #'as yet unclassified' }
LibroElectronico >> getInfo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|info|
	info := super getInfo.
	^ (info , ' tipo:electronico ')
]

{ #category : #'as yet unclassified' }
LibroElectronico >> getTipo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			

	^'libroElectronico'
]
