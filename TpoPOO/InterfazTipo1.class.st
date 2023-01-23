Class {
	#name : #InterfazTipo1,
	#superclass : #Interfaz,
	#instVars : [
		'statements'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
InterfazTipo1 >> iniciarBotonMenu [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|boton|
	boton := (BotonTipo1 crearBoton: 'Menu').
	colBotones add: boton.
	boton position: 40@780.
	self addMorph:boton.
	boton mouseAction: [ventana cambiarInterfaz: boton getNombre].

]
