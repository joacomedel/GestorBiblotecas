Class {
	#name : #InformacionUsuario,
	#superclass : #InterfazTipo1,
	#instVars : [
		'colCampos',
		'colAviso',
		'scrollLibros',
		'colDatos',
		'colLibros',
		'scrollUsuario',
		'colFilas',
		'botonModalidad',
		'botonPrestamo',
		'botonLibro',
		'botonReiniciar'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
InformacionUsuario >> agregarDatosUsuario [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|colPrestamos|	
	scrollUsuario agregarTexto: 'Nombre:',(colDatos at:1).
	scrollUsuario agregarTexto: 'Apellido:',(colDatos at:2).
	scrollUsuario agregarTexto: 'DNI:',(colDatos at:3).
	scrollUsuario agregarTexto: 'TIPO USUARIO:',(colDatos at:4).
	scrollUsuario agregarTexto: 'Prestamos:'.
	"Si tiene tamaño 5 entonces tiene una coleccion con prestamos"
	(colDatos size >= 5) ifTrue: [colPrestamos := colDatos at:5.colPrestamos do:[:prestamoDatos | scrollUsuario agregarTexto:prestamoDatos].]
	
]

{ #category : #'as yet unclassified' }
InformacionUsuario >> agregarLibro [
"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
		|libro faltanCampos libroRepetido|
		faltanCampos := colCampos anySatisfy:[:campo | (campo text) isEmpty].
		libroRepetido := false.
		colLibros isEmpty ifFalse:[ libroRepetido := colLibros anySatisfy:[:libroRep | libroRep verificarNombre: ((colCampos at:4) getTexto) asString ]].
		(faltanCampos or: libroRepetido) ifFalse:[
			libro := ventana buscarLibro:(((colCampos at:4) getTexto) asString) biblotecaId:(((colCampos at:3)getTexto) asString)asInteger.
			(libro isNil) ifFalse: [ 
				scrollLibros agregarTexto: (libro getNombre).
				colLibros add:libro.
			 ]
		]
	
]

{ #category : #'as yet unclassified' }
InformacionUsuario >> alternarModalidad:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	ventana alternarModalidad:dni contraseña:contraseña.
]

{ #category : #'as yet unclassified' }
InformacionUsuario >> buscarUsuario [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|noPuedeBuscar|
	botonModalidad = nil ifFalse:[botonModalidad delete].
	botonPrestamo = nil ifFalse:[botonPrestamo delete].
	botonReiniciar  = nil ifFalse:[botonPrestamo delete].
	botonLibro = nil ifFalse:[botonPrestamo delete].
	scrollUsuario resetear.
	noPuedeBuscar := ((colCampos at:1)text isEmpty) | ((colCampos at:2)text isEmpty).
	noPuedeBuscar ifTrue:[self mostrarAviso:1] ifFalse:[colDatos := ventana buscarUsuario:((colCampos at:1) getTexto)contraseña:((colCampos at:2) getTexto)]; ifFalse:[
	colDatos isEmpty ifTrue:[self mostrarAviso:2] ifFalse:[self usuarioEncontrado ]
		]
	
			
]

{ #category : #'as yet unclassified' }
InformacionUsuario >> iniciarInterfaz [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|x botonBuscar|
	"Inicializamos variables basicas"
	nombre := 'Informacion Usuario'.
	
	
	colLibros := OrderedCollection new.
	
	"Creamos una collecion de campos a rellenar , agregamos campos con texto fantasma y los posicionamos en el morph"
	x :=20.
	colCampos := OrderedCollection new.
	colCampos add:(CampoDeTexto crear:'DNI Usuario').
	colCampos add:(CampoDeTexto crear:'Contraseña').
	colCampos add:(CampoDeTexto crear:'Id bibloteca').
	colCampos add:(CampoDeTexto crear:'Nombre libro').	
	self addMorph: (colCampos at:1).
	self addMorph: (colCampos at:2).
	self addMorph: (colCampos at:3).
	self addMorph: (colCampos at:4).
	(colCampos at:1) position: 10@20.
	(colCampos at:2) position: 230@20.
	(colCampos at:3) position: 10@60.
	(colCampos at:4) position: 230@60.
	
	"Inicializamos el boton de accion"
	botonBuscar := BotonTipo1 crear: 'Buscar'.
	self addMorph:botonBuscar.
	botonBuscar position: 40@720.
	botonBuscar mouseAction:[self buscarUsuario].
	
	"Inicializamos la coleccion de avisos"
	colAviso := OrderedCollection new.
	colAviso add: (MorphAviso crear:'Faltan campos por rellenar').
	colAviso add: (MorphAviso crear:'Usuario no encontrado , cambiar dni o contraseña').
	
	scrollLibros := ScrollMorph crear:150 y:200  cabecera:'libros a agregar'.
	self addMorph:scrollLibros.
	scrollLibros position: 325@150.
	
	scrollUsuario  := ScrollMorph crear:250 y:200  cabecera:'Datos Usuario'.
	self addMorph:scrollUsuario.
	scrollUsuario position: 20@150.
	self iniciarBotonMenu.
	
]

{ #category : #'as yet unclassified' }
InformacionUsuario >> mostrarAviso:x [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|error|
	error := colAviso at:x.
	ventana addMorphCentered:error.
	error position:(ventana position) + (40@580).
]

{ #category : #'as yet unclassified' }
InformacionUsuario >> registrarPrestamo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
		|i|	
	i := ventana registrarPrestamo:(colDatos at:3) clone colLibros:colLibros  idBibloteca: ((colCampos at:3)getTexto) asInteger.
	i=1 ifTrue:[ Transcript show: 'REGISTRAR PRESTAMO EXITO'].
	i=(-1) ifTrue:[ Transcript show: 'USUARIO O BIBLIOTECA NO ENCONTRADO'].
	i=(-2) ifTrue:[ Transcript show: 'USUARIO NO PLUS QUIERE AUDIOLIBRO'].

]

{ #category : #'as yet unclassified' }
InformacionUsuario >> reiniciar [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	scrollLibros resetear.
	(colCampos at:3) setText:''.
	(colCampos at:4) setText:''.
	colLibros := OrderedCollection new.
]

{ #category : #updating }
InformacionUsuario >> update:i [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	self buscarUsuario.
]

{ #category : #'as yet unclassified' }
InformacionUsuario >> usuarioEncontrado [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			

	self agregarDatosUsuario.
	botonModalidad := BotonTipo1 crear:'Cambiar modalidad plus'x:160 y:40.
	botonModalidad mouseAction: [self alternarModalidad:((colCampos at:1) getTexto) contraseña:((colCampos at:2) getTexto)].
	botonModalidad position:(ventana position) + (40@670).
	self addMorph: botonModalidad.
	
	botonPrestamo := BotonTipo1 crear:'Agregar Prestamo'x:230 y:40. 
	botonPrestamo mouseAction: [self registrarPrestamo].
	self addMorph:botonPrestamo.
	botonPrestamo position: (ventana position) + (210@670).
	
	botonReiniciar := BotonTipo1 crear:'Reiniciar'x:160 y:40.
	botonReiniciar mouseAction: [ self reiniciar ].
	self addMorph: botonReiniciar.
	botonReiniciar position:(ventana position) + (40@620).
	
	botonLibro := BotonTipo1 crear:'agregarLibro'x:230 y:40. 
	botonLibro mouseAction:[self agregarLibro].
	self addMorph:botonLibro.
	botonLibro position: (ventana position) + (210@620).
	 
	
	
	
	
]
