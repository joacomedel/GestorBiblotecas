Class {
	#name : #Interfaz,
	#superclass : #Morph,
	#instVars : [
		'nombre',
		'ventana'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
Interfaz class >> crear:ventanaIn [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	|temp|
	temp := self new.
	temp iniciar.
	temp setVentana: ventanaIn.
	^temp.
]

{ #category : #'as yet unclassified' }
Interfaz >> comprobarNombre:nombreIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^nombreIn = nombre.	
]

{ #category : #'as yet unclassified' }
Interfaz >> iniciar [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|boton fondo|
	self extent: 480@854.
	"fondo := (Form fromFileNamed: 'C:\Users\Joaco\Documents\Pharo\images\Pharo 9.0 - 64bit (stable)\pharo-local\iceberg\GestorBiblotecas\Resources\backgroundTipo1.png') asMorph  .
	self addMorph: fondo."
	self borderWidth: 2.
	self borderColor: Color white.
	self iniciarInterfaz.
	boton := BotonTipo2 crear:'X'.
	self addMorphFront:boton.
	boton position: 444@1.
	boton mouseAction: [ventana close].  
]

{ #category : #'as yet unclassified' }
Interfaz >> iniciarInterfaz [
	"metodo sobreescrito en cada tipo de interfaz"
	
	
	
	
]

{ #category : #initialization }
Interfaz >> setVentana:ventanaIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	ventana := ventanaIn.
]
