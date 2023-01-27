Class {
	#name : #RegistrarUsuario,
	#superclass : #InterfazTipo1,
	#instVars : [
		'colCampos',
		'botonPlus',
		'botonRegistrar',
		'colAviso'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
RegistrarUsuario >> iniciarInterfaz [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|y registro  codigoBoton|
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
	botonRegistrar := BotonTipo1 crear: 'Registrar'.
	botonRegistrar position: 40@700.
	self addMorph:botonPlus; addMorph:botonRegistrar.
	botonPlus position: 40@y; label:  'plus' ; extent:100@20; borderWidth:3;borderColor: Color black; color: Color black .
	
	colAviso := OrderedCollection new.
	colAviso add: (MorphAviso  crear:'Faltan campos por rellenar').
	colAviso add: (MorphAviso  crear:'Dni ya ingresado , no puede crear dos cuentas con el mismo dni').
	colAviso add: (MorphAviso crear:'Usuario registrado').
	botonRegistrar mouseAction: [self registrarUsuario].
	
	
	
	
	
]

{ #category : #'as yet unclassified' }
RegistrarUsuario >> mostrarError:x [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	 |error|
	error := colAviso at:x.
	self addMorphCentered:error.
	error position: 60@650.
]

{ #category : #'as yet unclassified' }
RegistrarUsuario >> registrarUsuario [
		|noPuedeRegistrar|
		colAviso do: [:aviso | aviso delete].
		noPuedeRegistrar  := colCampos anySatisfy:[:campo | campo text isEmpty].
		noPuedeRegistrar ifFalse:[
			|pudoRegistrar|
			pudoRegistrar := (ventana registrarUsuario:((colCampos at:1) text ) apellido:((colCampos at:2) text )  dni:((colCampos at:3) text )  contrasena:((colCampos at:4) text ) plus: botonPlus isSelected).
			pudoRegistrar ifTrue: [self mostrarError:3. ] ; ifFalse:[self mostrarError:2.].
		]; 
		ifTrue:[
			self mostrarError:1.
			].
		
]
