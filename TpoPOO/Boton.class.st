Class {
	#name : #Boton,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'nombre',
		'bloque'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
Boton class >> crearBoton:string [
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
Boton >> iniciar:string [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	
	nombre := string.
	self label:nombre.
	self extent: 400@50.
	self color: Color gray.
	self borderWidth: 1.
	self borderColor: Color white.
	self roundedCorners: 10.
	
	
	
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
