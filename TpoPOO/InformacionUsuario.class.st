Class {
	#name : #InformacionUsuario,
	#superclass : #InterfazTipo1,
	#instVars : [
		'colCampos',
		'colAviso',
		'tablaDatos',
		'colFilas'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
InformacionUsuario >> alternarModalidad:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	ventana alternarModalidad:dni contraseña:contraseña.
	tablaDatos alternarModalidad.
]

{ #category : #'as yet unclassified' }
InformacionUsuario >> buscarUsuario [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|noPuedeBuscar colDatos|
	tablaDatos = nil ifFalse:[tablaDatos delete].
	noPuedeBuscar := colCampos anySatisfy:[:campo | (campo text) isEmpty].
	noPuedeBuscar ifTrue:[self mostrarAviso:1] ifFalse:[colDatos := ventana buscarUsuario:((colCampos at:1) getTexto)contraseña:((colCampos at:2) getTexto)]; ifFalse:[
	colDatos isEmpty ifTrue:[self mostrarAviso:2] ifFalse:[self usuarioEncontrado:colDatos ]
		]
	
			
]

{ #category : #'as yet unclassified' }
InformacionUsuario >> iniciarInterfaz [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|x botonBuscar|
	"Inicializamos variables basicas"
	nombre := 'Informacion Usuario'.
	"Creamos una collecion de campos a rellenar , agregamos campos con texto fantasma y los posicionamos en el morph"
	x :=20.
	colCampos := OrderedCollection new.
	colCampos add:(CampoDeTexto crear:'DNI Usuario').
	colCampos add:(CampoDeTexto crear:'Contraseña').
	colCampos do:[:campo| self addMorph:campo . campo position:x@100.x:=x+250].
	"Inicializamos el boton de accion"
	botonBuscar := BotonTipo1 crear: 'Buscar'.
	self addMorph:botonBuscar.
	botonBuscar position: 40@700.
	botonBuscar mouseAction:[self buscarUsuario].
	"Inicializamos la coleccion de avisos"
	colAviso := OrderedCollection new.
	colAviso add: (MorphAviso crear:'Faltan campos por rellenar').
	colAviso add: (MorphAviso crear:'Usuario no encontrado , cambiar dni o contraseña').
	
	colFilas := OrderedCollection new.
	colFilas add:'nombre' ;add:'apellido';add:'dni';add:'plus'.
	self iniciarBotonMenu.
	
]

{ #category : #'as yet unclassified' }
InformacionUsuario >> mostrarAviso:x [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|error|
	error := colAviso at:x.
	ventana addMorphCentered:error.
	error position:(ventana position) + (40@600).
]

{ #category : #'as yet unclassified' }
InformacionUsuario >> usuarioEncontrado:colDatos [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| boton |
	tablaDatos := InfoMorph crear: colDatos filas:colFilas. self addMorphCentered:tablaDatos . tablaDatos position:(ventana position) + (100@300).
	boton := BotonTipo1 crear:'Cambiar modalidad plus'.
	boton mouseAction: [self alternarModalidad:((colCampos at:1) getTexto) contraseña:((colCampos at:2) getTexto)].
	boton position:(ventana position) + (40@700).
	self addMorph: boton.
	
	
]
