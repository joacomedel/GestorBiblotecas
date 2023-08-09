Class {
	#name : #Autor,
	#superclass : #Object,
	#instVars : [
		'nombreAutor'
	],
	#category : #'TpoPOO-Modelo'
}

{ #category : #'as yet unclassified' }
Autor class >> crear:autorNombre [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	| tmp |
	tmp := self new.
	tmp iniciar:autorNombre.
	^tmp.
]

{ #category : #'as yet unclassified' }
Autor >> iniciar:autorNombre [.
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	nombreAutor := autorNombre .
]
