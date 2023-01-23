Class {
	#name : #Controlador,
	#superclass : #Object,
	#instVars : [
		'visual',
		'modelo'
	],
	#category : #'TpoPOO-Controlador'
}

{ #category : #'instance creation' }
Controlador class >> newControlador [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	|controlador visual modelo|
	controlador := self new.
	visual := Visual newVisual:controlador.
	modelo := Modelo newModelo:controlador.
	controlador incializarVisual:visual modelo:modelo.
	
]

{ #category : #'as yet unclassified' }
Controlador >> incializarVisual:visualIn modelo:modeloIn [.
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	visual := visualIn.
	modelo := modeloIn.
]
