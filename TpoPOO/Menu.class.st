Class {
	#name : #Menu,
	#superclass : #Interfaz,
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
Menu >> iniciarInterfaz [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	|y|
	nombre := 'Menu'.
	colBotones add: (BotonTipo1 crear: 'Agregar Bibloteca').
	colBotones add: (BotonTipo1 crear: 'Registrar Usuario').
	colBotones add: (BotonTipo1 crear: 'Solicitar Prestamo').
	colBotones add: (BotonTipo1 crear: 'Cambiar Modalidad').
	colBotones add: (BotonTipo1 crear: 'Actualizar Bibloteca').
	colBotones add: (BotonTipo1 crear: 'Informacion Usuario').
	colBotones add: (BotonTipo1 crear: 'Informacion Bibloteca').
	y:=50.
	colBotones do:[:boton|
		self addMorph:boton.
		boton position:40@y.
		y := y + 116.
		boton mouseAction: [ventana cambiarInterfaz: boton getNombre].
		]
]
