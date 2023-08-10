Class {
	#name : #AgregarBibloteca,
	#superclass : #InterfazTipo1,
	#instVars : [
		'colCamposBib',
		'colCamposLib',
		'botonAgregar',
		'botonResetear',
		'botonAgregarLibros',
		'scrollLibros',
		'colLibros',
		'colAvisos'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
AgregarBibloteca >> agregarBibloteca [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|faltanCampos noHayLibros unNombre unaDireccion unTelefono unRepresentante|
	unNombre := (colCamposBib at:1) getTexto.
	unaDireccion := (colCamposBib at:2) getTexto.
	unTelefono := (colCamposBib at:3) getTexto.
	unRepresentante := (colCamposBib at:4) getTexto.
	faltanCampos := colCamposBib anySatisfy:[:campo | (campo text) isEmpty].
	noHayLibros := colLibros  isEmpty.
	Transcript show: noHayLibros.
	(faltanCampos | noHayLibros ) ifFalse:[ventana nombre: unNombre direccion: unaDireccion telefono: unTelefono representante:unRepresentante  libros: colLibros.
		self mostrarAviso:4.
		];
	ifTrue:[
		self mostrarAviso:2.
		]
	

]

{ #category : #'as yet unclassified' }
AgregarBibloteca >> agregarBibloteca: unNombre direccion: unaDireccion  telefono: unTelefono representante: unRepresentante [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|faltanCampos noHayLibros|
	faltanCampos := colCamposBib anySatisfy:[:campo | (campo text) isEmpty].
	noHayLibros := colLibros  isEmpty.
	Transcript show: noHayLibros.
	(faltanCampos | noHayLibros ) ifFalse:[ventana nombre: unNombre direccion: unaDireccion telefono: unTelefono representante:unRepresentante  libros: colLibros.
		self mostrarAviso:4.
		];
	ifTrue:[
		self mostrarAviso:2.
		]
	

]

{ #category : #'as yet unclassified' }
AgregarBibloteca >> agregarLibros [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|colNombreAutores subStrings noPuedeAgregar nombreIn autoresIn editorialIn anioIn|
	nombreIn := (colCamposLib at:1) getTexto.
	autoresIn := (colCamposLib at:4) getTexto.
	editorialIn := (colCamposLib at:2) getTexto.
	anioIn := (colCamposLib at:3) getTexto. 
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
AgregarBibloteca >> agregarLibros:nombreIn autores:autoresIn editorial:editorialIn anioEdicion:anioIn [
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
	self addMorph:botonAgregar.
	botonAgregar position: 40@700.
	botonAgregar mouseAction: [self agregarBibloteca].
	
	botonAgregarLibros := BotonTipo1 crear:'Agregar Libro'.
	self addMorph:botonAgregarLibros.
	botonAgregarLibros position: 40@640.
	botonAgregarLibros mouseAction: [self agregarLibros].
	
	botonResetear :=  BotonTipo1 crear:'Resetear'.
	self addMorph:botonResetear.
	botonResetear position: 40@580.
	botonResetear mouseAction: [self resetear].
	
	"Preparo el scroll libros"
	scrollLibros := ScrollMorph crear: 220 y: 160  cabecera: 'Libro || Autor'.
	self addMorphCentered:scrollLibros.
	scrollLibros position: 250@250.
	
	
	
	colAvisos := OrderedCollection new.
	colAvisos add: (MorphAviso crear: 'Faltan campos para libros').
	colAvisos add: (MorphAviso crear: 'Faltan campos para biblotecas , o faltan libros').
	colAvisos add: (MorphAviso crear: 'Libro agregado con exito').
	colAvisos add: (MorphAviso crear: 'Bibloteca agregada con exito').
	colAvisos add: (MorphAviso crear: 'Reseteo').
	

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
	aviso position:(ventana position) + (40@500).
]

{ #category : #'as yet unclassified' }
AgregarBibloteca >> resetear [.
	colLibros := OrderedCollection new.
	scrollLibros resetear.
	colCamposBib do: [:campo |campo setText: ''].
	colCamposLib  do: [:campo |campo setText: ''].
	self mostrarAviso:5.
			

]
