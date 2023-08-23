Class {
	#name : #InterfazTipo1,
	#superclass : #Interfaz,
	#instVars : [
		'statements'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
InterfazTipo1 >> cambiarInterfaz:nombreInterfaz [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| temporary variable names |
	ventana cambiarInterfaz:nombreInterfaz.
]

{ #category : #'as yet unclassified' }
InterfazTipo1 >> iniciarBotonMenu [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|boton|
	boton := (BotonTipo1 crear: 'Menu').
	"colBotones add: boton."
	boton position: 40@780.
	self addMorph:boton.
	boton mouseAction: [self cambiarInterfaz: boton getNombre].

]
