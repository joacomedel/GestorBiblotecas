Class {
	#name : #InformacionBibloteca,
	#superclass : #InterfazTipo1,
	#instVars : [
		'scrollBiblotecas',
		'scrollPrestamos',
		'infoBibloteca',
		'botonBuscarBibl',
		'campoBibloteca',
		'scrollLibros'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
InformacionBibloteca >> actualizarBibloteca [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			|infoBiblotecas|
	scrollBiblotecas resetear.
	infoBiblotecas := ventana devolverBiblotecasInfo.
	infoBiblotecas isNotNil ifTrue: [
		infoBiblotecas do: [:infoBibl | scrollBiblotecas agregarTexto: infoBibl]. 
		].
	
	
]

{ #category : #'as yet unclassified' }
InformacionBibloteca >> iniciarInterfaz [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	
	nombre := 'Informacion Bibloteca'.
	

	campoBibloteca := CampoDeTexto crear:'Id de la bibloteca'.
	campoBibloteca position:20@40.
	self addMorph: campoBibloteca.

	infoBibloteca  := ScrollMorph crear:450 y:100  cabecera:'Informacion Bibloteca'.
	infoBibloteca position:20@100.
	self addMorph: infoBibloteca.
	
	scrollBiblotecas := ScrollMorph crear:175 y:200  cabecera:'Id , Nombre'.  
	scrollBiblotecas position:20@320.
	self addMorph: scrollBiblotecas.
	
	scrollLibros := ScrollMorph crear:450 y:100 cabecera:'Libros de la biblioteca'.
	scrollLibros position:20@215.
	self addMorph: scrollLibros.
	
	scrollPrestamos := ScrollMorph crear:265 y:200 cabecera:'Prestamos de la biblioteca'.
	scrollPrestamos position:205@320.
	self addMorph:scrollPrestamos.
	
	botonBuscarBibl := BotonTipo1 crear: 'Buscar bibloteca'.
	botonBuscarBibl position:40@640.
	self addMorph: botonBuscarBibl.
	botonBuscarBibl mouseAction: [self mostrarBibloteca ].
	
	self iniciarBotonMenu.
]

{ #category : #'as yet unclassified' }
InformacionBibloteca >> mostrarBibloteca [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|id faltanCampos colDatosBib colDatosLib colDatosPrestamo|
	infoBibloteca resetear.
	scrollLibros resetear.
	scrollPrestamos resetear.
	faltanCampos := campoBibloteca text isEmpty.
	faltanCampos ifTrue:[Transcript show: 'Faltan campos'];ifFalse:[
		id := campoBibloteca getTexto.
		colDatosBib := (ventana infoBibloteca:((id asString) asInteger)).
		
		(colDatosBib isNil) ifTrue:[
			];ifFalse:[
			
			
			infoBibloteca agregarTexto: 'ID:' , (colDatosBib at:1) asString.
			infoBibloteca agregarTexto: 'nombre:' , (colDatosBib at:3).
			infoBibloteca agregarTexto: 'Dir:' , (colDatosBib at:2).
			infoBibloteca agregarTexto: 'nombreRepresentante:' , (colDatosBib at:5).
			infoBibloteca agregarTexto: 'telefonoRepresentante:' , (colDatosBib at:4).
			"Agrego scroll con los libros "
			colDatosLib := (colDatosBib at:6).
			colDatosLib do: [:datosLib | scrollLibros agregarTexto: datosLib ].
			
			colDatosPrestamo := (colDatosBib at:7).
			colDatosPrestamo do: [:datosPrestamo | scrollPrestamos agregarTexto: datosPrestamo].
			
			]
		
		]
	
]

{ #category : #updating }
InformacionBibloteca >> update:asd [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	
	self actualizarBibloteca.
	self mostrarBibloteca.
]
