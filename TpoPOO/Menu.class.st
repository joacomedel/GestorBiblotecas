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
	colBotones add: (Boton crearBoton: 'Agregar_Bibloteca').
	colBotones add: (Boton crearBoton: 'Registrar_Usuario').
	colBotones add: (Boton crearBoton: 'Solicitar_Prestamo').
	colBotones add: (Boton crearBoton: 'Cambiar_Modelidad ').
	colBotones add: (Boton crearBoton: 'Actualizar_Bibloteca ').
	colBotones add: (Boton crearBoton: 'Infromacion_Usuario ').
	colBotones add: (Boton crearBoton: 'Informacion_Bibloteca').
	y:=50.
	colBotones do:[:boton|
		self addMorph:boton.
		boton position:40@y.
		y := y + 116.
		boton mouseAction: [ventana cambiarInterfaz: boton getNombre].
		]
]
