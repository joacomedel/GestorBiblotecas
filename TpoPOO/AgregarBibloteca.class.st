Class {
	#name : #AgregarBibloteca,
	#superclass : #InterfazTipo1,
	#instVars : [
		'colCamposBib',
		'colCamposLib',
		'botonAgregar',
		'botonAgregarLibros',
		'scrollLibros',
		'colLibros',
		'colAvisos'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
AgregarBibloteca >> AgregarBibloteca: unNombre direccion: unaDireccion  telefono: unTelefono representante: unRepresentante [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|faltanCampos noHayLibros|
	faltanCampos := colCamposBib anySatisfy:[:campo | campo text isEmpty].
	noHayLibros := colCamposLib isEmpty.
	(faltanCampos or: noHayLibros ) ifFalse:[ventana nombre: unNombre direccion: unaDireccion telefono: unTelefono representante:unRepresentante  libros: colLibros.
		self mostrarAviso:4.
		];
	ifTrue:[
		self mostrarAviso:2.
		]
	

]

{ #category : #'as yet unclassified' }
AgregarBibloteca >> AgregarLibros:nombreIn autores:autoresIn editorial:editorialIn anioEdicion:anioIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|colNombreAutores subStrings noPuedeAgregar|
	noPuedeAgregar  := colCamposLib  anySatisfy:[:campo | campo text isEmpty].
	noPuedeAgregar ifFalse: [ scrollLibros agregarTexto: (nombreIn ,'||  ', autoresIn).
	colNombreAutores := OrderedCollection new.
	subStrings := ((autoresIn asString) substrings: ', ').
	subStrings do: [:subString | colNombreAutores add: subString.].
	colLibros add: (ventana crearLibro:nombreIn editorial:editorialIn anioEdicion:anioIn  autores:colNombreAutores). 
	self mostrarAviso:3.
	] 
    ifTrue: [ self mostrarAviso:1.
	]
	
	
	
	
	
	
]

{ #category : #'as yet unclassified' }
AgregarBibloteca >> iniciarInterfaz [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|y|
	nombre := 'Agregar Bibloteca'.
	colCamposBib := OrderedCollection new.
	colCamposLib := OrderedCollection new.
	colLibros := OrderedCollection new.
	colCamposBib add: (CampoDeTexto crear:'nombre').
	colCamposBib add: (CampoDeTexto crear:'direccion').
	colCamposBib add: (CampoDeTexto crear:'telefono de contacto').
	colCamposBib add: (CampoDeTexto crear:'nombre del representante').
	y := 50.
	colCamposBib do:[:campo|  self addMorph:(campo position: 40@y).y := y+40].
	colCamposLib add: (CampoDeTexto crear:'Nombre').
	colCamposLib add: (CampoDeTexto crear:'Editorial').
	colCamposLib add: (CampoDeTexto crear:'Año de edicion').
	colCamposLib add: (CampoDeTexto crear:'Autores separados con ,').
	y := y+40.
	colCamposLib do:[:campo|  self addMorph:(campo position: 40@y).y := y+40].
	botonAgregar := BotonTipo1 crear: 'Agregar Bibloteca '.
	botonAgregarLibros := BotonTipo1 crear:'Agregar Libro'.
	self addMorph:botonAgregar.
	self addMorph:botonAgregarLibros.
	botonAgregar position: 40@700.
	botonAgregarLibros position: 40@640.
	
	"Preparo el scroll libros"
	scrollLibros := ScrollMorph crear: 220 y: 160  cabecera: 'Libro || Autor'.
	self addMorphCentered:scrollLibros.
	scrollLibros position: 250@250.
	botonAgregarLibros mouseAction: [self AgregarLibros: ((colCamposLib at:1) text) autores: ((colCamposLib at:4) text) editorial:((colCamposLib at:2) text) anioEdicion:((colCamposLib at:3) text)].
	botonAgregar mouseAction: [self AgregarBibloteca: ((colCamposBib at:1) text)direccion: ((colCamposBib at:2) text) telefono:((colCamposBib at:3) text)  representante:((colCamposBib at:4) text)].
	
	colAvisos := OrderedCollection new.
	colAvisos add: (MorphAviso crear: 'Faltan campos para libros').
	colAvisos add: (MorphAviso crear: 'Faltan campos para biblotecas , o faltan libros').
	colAvisos add: (MorphAviso crear: 'Libro agregado con exito').
	colAvisos add: (MorphAviso crear: 'Bibloteca agregada con exito').
	
	self iniciarBotonMenu.
]

{ #category : #'as yet unclassified' }
AgregarBibloteca >> mostrarAviso:x [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	 |aviso|
	colAvisos do: [:avisoTemp | avisoTemp delete].
	aviso := colAvisos at:x.
	ventana addMorphCentered:aviso.
	aviso position:(ventana position) + (40@550).
]
