Class {
	#name : #Menu,
	#superclass : #Interfaz,
	#instVars : [
		'colBotones'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
Menu >> iniciarInterfaz [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	|y|
	nombre := 'Menu'.
	colBotones := OrderedCollection new.
	colBotones add: (BotonTipo1 crear: 'Agregar Bibloteca').
	colBotones add: (BotonTipo1 crear: 'Registrar Usuario').
	colBotones add: (BotonTipo1 crear: 'Actualizar Bibloteca').
	colBotones add: (BotonTipo1 crear: 'Informacion Usuario').
	colBotones add: (BotonTipo1 crear: 'Informacion Bibloteca').
	y:=70.
	colBotones do:[:boton|
		self addMorph:boton.
		boton position:40@y.
		y := y + 160.
		boton mouseAction: [ventana cambiarInterfaz: boton getNombre].
		]
]
