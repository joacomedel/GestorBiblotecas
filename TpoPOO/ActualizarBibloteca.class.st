Class {
	#name : #ActualizarBibloteca,
	#superclass : #InterfazTipo1,
	#instVars : [
		'campoBiblioteca',
		'scrollLibros',
		'colCamposLib',
		'camNombreLibro',
		'botonSacarLibro',
		'botonAgregarLibro',
		'agregarABibliotecas',
		'colLibros'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
ActualizarBibloteca >> agregarABiblioteca [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	ventana agregarLibrosABiblioteca:colLibros idBiblioteca: campoBiblioteca getTexto asInteger. 	
			
	
]

{ #category : #'as yet unclassified' }
ActualizarBibloteca >> agregarLibros [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|colNombreAutores subStrings faltanCampos tipoMalIngresado nombreIn autoresIn editorialIn anioIn tipo|
	nombreIn := (colCamposLib at:1) getTexto.
	autoresIn := (colCamposLib at:4) getTexto.
	editorialIn := (colCamposLib at:2) getTexto.
	anioIn := (colCamposLib at:3) getTexto. 
	tipo := (colCamposLib at:5) getTexto. 
	faltanCampos  := colCamposLib  anySatisfy:[:campo | campo text isEmpty].
	tipoMalIngresado := ((tipo ~= 'audio' and: tipo ~= 'libro') and: tipo ~= 'elec').
	(faltanCampos or:tipoMalIngresado) ifFalse: [ scrollLibros agregarTexto: (nombreIn ,'||  ', autoresIn).
	colNombreAutores := OrderedCollection new.
	subStrings := ((autoresIn asString) substrings: ', ').
	subStrings do: [:subString | colNombreAutores add: subString.].
	colLibros add: (ventana crearLibro:nombreIn editorial:editorialIn anioEdicion:anioIn  autores:colNombreAutores tipo:tipo).
	] 
    ifTrue: [ faltanCampos ifTrue:[] ; ifFalse:[].
	]
]

{ #category : #'as yet unclassified' }
ActualizarBibloteca >> iniciarInterfaz [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|y|
	colCamposLib := OrderedCollection new.
	colLibros := OrderedCollection new.
	
	nombre := 'Actualizar Bibloteca'.
	y:= 40.
	
	colCamposLib add: (CampoDeTexto crear:'Nombre').
	colCamposLib add: (CampoDeTexto crear:'Editorial').
	colCamposLib add: (CampoDeTexto crear:'Año de edicion').
	colCamposLib add: (CampoDeTexto crear:'Autores separados con ,').
	colCamposLib add: (CampoDeTexto crear:'Tipo , elec , audio, libro').
	
	camNombreLibro := (CampoDeTexto crear:'NombreLibroABorrar').
	self addMorph:camNombreLibro.
	camNombreLibro position: 40@320.
	
	y := y+80.
	colCamposLib do:[:campo|  self addMorph:(campo position: 40@y).y := y+40].
	
	campoBiblioteca := CampoDeTexto crear:'Id biblioteca'.
	self addMorph: campoBiblioteca.
	campoBiblioteca position:40@20.
	
	botonAgregarLibro  :=  BotonTipo1 crear:'agregarLibro'.
	self addMorph:botonAgregarLibro.
	botonAgregarLibro position: 40@700.
	botonAgregarLibro mouseAction: [self agregarLibros].
	
	
	agregarABibliotecas  :=  BotonTipo1 crear:'agregarABiblioteca'.
	self addMorph:agregarABibliotecas.
	agregarABibliotecas position: 40@640.
	agregarABibliotecas mouseAction: [self agregarABiblioteca ].
	
	botonSacarLibro   :=  BotonTipo1 crear:'sacarLibro'.
	self addMorph:botonSacarLibro.
	botonSacarLibro position: 40@580.
	botonSacarLibro mouseAction: [self sacarLibro  ].
	
	scrollLibros := ScrollMorph crear: 220 y: 160  cabecera: 'Libro || Autor'.
	self addMorphCentered:scrollLibros.
	scrollLibros position: 250@20.
	
	
	
	self iniciarBotonMenu.
]

{ #category : #'as yet unclassified' }
ActualizarBibloteca >> sacarLibro [
	ventana sacarLibro:(campoBiblioteca getTexto )asInteger nombreLibro: camNombreLibro getTexto. 
	
]
