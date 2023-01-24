Class {
	#name : #RegistrarUsuario,
	#superclass : #InterfazTipo1,
	#instVars : [
		'colCampos',
		'botonPlus',
		'botonRegistrar'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
RegistrarUsuario >> iniciarInterfaz [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|y|
	nombre := 'Registrar Usuario'.
	self iniciarBotonMenu.
	colCampos := OrderedCollection new.
	colCampos add: (CampoDeTexto crear:'nombre').
	colCampos add: (CampoDeTexto crear:'apellido').
	colCampos add: (CampoDeTexto crear:'dni').
	colCampos add: (CampoDeTexto crear:'contraseña').
	botonPlus := CheckboxMorph new.
	y := 50.
	colCampos do:[:campo|  self addMorph:(campo position: 40@y).y := y+100].
	botonRegistrar := BotonTipo1 crearBoton: 'Registrar'.
	botonRegistrar position: 40@700.
	self addMorph:botonPlus; addMorph:botonRegistrar.
	botonPlus position: 40@y; label:  'plus' ; extent:100@20; borderWidth:3;borderColor: Color black.
	
	
	
	
	
]
