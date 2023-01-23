Class {
	#name : #Interfaz,
	#superclass : #Morph,
	#instVars : [
		'colBotones',
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
	|boton|
	self extent: 480@854.
	self color: Color brown.
	self borderWidth: 2.
	self borderColor: Color white.
	colBotones := OrderedCollection new.
	self iniciarInterfaz.
	boton := BotonTipo2 crearBoton:'X'.
	self addMorph:boton.
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
