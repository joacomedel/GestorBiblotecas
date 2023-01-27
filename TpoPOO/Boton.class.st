Class {
	#name : #Boton,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'bloque',
		'nombre'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
Boton class >> crear:string [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	| button |
	button := self new.
	button iniciar:string.
	^button
]

{ #category : #'as yet unclassified' }
Boton >> getNombre [.
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^nombre.
]

{ #category : #'as yet unclassified' }
Boton >> mouseAction:bloqueIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	
	bloque := bloqueIn.
]

{ #category : #'event handling' }
Boton >> mouseUp: evento [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	super mouseUp: evento.
	bloque value.
]
