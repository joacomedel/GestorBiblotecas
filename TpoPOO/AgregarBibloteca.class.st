Class {
	#name : #AgregarBibloteca,
	#superclass : #InterfazTipo1,
	#instVars : [
		'colCamposBib',
		'colCamposLib',
		'botonAgregar',
		'botonAgregarLibros',
		'scrollLibros'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
AgregarBibloteca >> AgregarLibros:nombreIn autores:autoresIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	

	scrollLibros agregarTexto: (nombreIn ,'||  ', autoresIn).
	
	
	
]

{ #category : #'as yet unclassified' }
AgregarBibloteca >> iniciarInterfaz [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|y|
	nombre := 'Agregar Bibloteca'.
	colCamposBib := OrderedCollection new.
	colCamposLib := OrderedCollection new.
	colCamposBib add: (CampoDeTexto crear:'direccion').
	colCamposBib add: (CampoDeTexto crear:'nombre').
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
	botonAgregarLibros mouseAction: [self AgregarLibros: ((colCamposLib at:1) text) autores: ((colCamposLib at:4) text)].
	
	
	self iniciarBotonMenu.
]
