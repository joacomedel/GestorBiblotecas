Class {
	#name : #Visual,
	#superclass : #Object,
	#instVars : [
		'controlador',
		'ventana'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'instance creation' }
Visual class >> newVisual:controladorIn [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	|temp|
	temp := self new.
	temp incializar:controladorIn.
	^temp.
]

{ #category : #'as yet unclassified' }
Visual >> incializar:controladorIn [.
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	controlador := controladorIn.
	ventana := Ventana  new.
	ventana iniciarVentana.
	ventana openInWorld.
	
]
