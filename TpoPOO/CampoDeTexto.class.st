Class {
	#name : #CampoDeTexto,
	#superclass : #RubTextFieldMorph,
	#instVars : [
		'nombre'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
CampoDeTexto class >> crear:nombre [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	
	^ self new iniciar:nombre.
]

{ #category : #'as yet unclassified' }
CampoDeTexto >> getNombre [.
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^nombre.
]

{ #category : #'as yet unclassified' }
CampoDeTexto >> getTexto [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	^ self   text clone asString 
]

{ #category : #'as yet unclassified' }
CampoDeTexto >> iniciar: unNombre [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	nombre := unNombre.
	self extent:200@100 .
	self borderWidth: 3.
	self ghostText: nombre.
	self borderColor: Color black.
]
