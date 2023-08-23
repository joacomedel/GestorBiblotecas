Class {
	#name : #Modelo,
	#superclass : #Object,
	#instVars : [
		'controlador',
		'colBiblotecas',
		'colUsuarios',
		'colAutores'
	],
	#category : #'TpoPOO-Modelo'
}

{ #category : #'instance creation' }
Modelo class >> newModelo:controladorIn [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	| modelo |
	modelo := self new.
	modelo incializar:controladorIn.
	"Inicializo variables de clase del modelo"
	Biblioteca iniciarVariablesDeClase.
	^modelo.
]

{ #category : #'as yet unclassified' }
Modelo >> agregarDependencias:colVisuales [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
		Biblioteca addDependent: (colVisuales at:1).
		Usuario addDependent: (colVisuales at:2).
	
]

{ #category : #'as yet unclassified' }
Modelo >> alternarModalidad:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|usuario |
	usuario := self buscarColUsuario: dni contraseña: contraseña.
	usuario alternarModalidad.
	Usuario changed.
	
]

{ #category : #'as yet unclassified' }
Modelo >> buscarColUsuario:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	|usuario |
	colUsuarios do: [:us | |bool| bool :=  (us verificarUsuario: dni contraseña: contraseña) . bool ifTrue:[usuario := us]].
	^usuario.	
	
]

{ #category : #'as yet unclassified' }
Modelo >> buscarLibro:nombreLibro biblotecaId:id [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| bibloteca libroARetornar|
	colBiblotecas  do: [:bibl | |bool| bool :=  (bibl verificarId:id) . bool ifTrue:[bibloteca := bibl]].
	(bibloteca isNil) ifFalse:[libroARetornar := (bibloteca buscarLibro: nombreLibro)].
	^libroARetornar.
	
]

{ #category : #'as yet unclassified' }
Modelo >> buscarUsuario:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
		|usuario colDatos datosPrestamo prestamos|
	usuario := self buscarColUsuario: dni contraseña: contraseña.
	colDatos := OrderedCollection new.
	usuario = nil ifFalse:[colDatos := usuario recopilarDatos . prestamos := self recolectarPrestamos:usuario.prestamos = nil ifFalse: [prestamos do:[:prestamo | datosPrestamo add: prestamo getInfoPrestamo].
		colDatos add: datosPrestamo. "Agrego la coleccion con datos de sus prestamos "]].
	Transcript show: 'SALE BUSCAR USUARIO'.
	^colDatos.

]

{ #category : #'as yet unclassified' }
Modelo >> crearLibro:nombreIn editorial:editorialIn anioEdicion:anioEdicion  autores:autoresIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|libro|
	libro := Libro crear: nombreIn  editorial:editorialIn  anio: anioEdicion   colAutores: autoresIn. 
	^libro.
]

{ #category : #'as yet unclassified' }
Modelo >> crearLibro:nombreIn editorial:editorialIn anioEdicion:anioEdicion  autores:autoresIn tipo:tipo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|libro|
	tipo = 'libro' ifTrue: [ libro := Libro crear: nombreIn  editorial:editorialIn  anio: anioEdicion   colAutores: autoresIn. ].
	tipo = 'audio' ifTrue: [ libro := AudioLibro  crear: nombreIn  editorial:editorialIn  anio: anioEdicion   colAutores: autoresIn. ].
	tipo = 'elec' ifTrue: [ libro := LibroElectronico  crear: nombreIn  editorial:editorialIn  anio: anioEdicion   colAutores: autoresIn. ].
	^libro.
]

{ #category : #'as yet unclassified' }
Modelo >> devolverBiblotecasInfo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			|colBiblInfos|
	colBiblInfos := OrderedCollection new.
	colBiblotecas do: [:bibl | colBiblInfos add: (bibl devolverNombreId)].
	^colBiblInfos 
	
]

{ #category : #'as yet unclassified' }
Modelo >> incializar:controladorIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	controlador:= controladorIn.
	colAutores := OrderedCollection new.
	colBiblotecas := OrderedCollection new.
	colUsuarios := OrderedCollection new.
	
]

{ #category : #'as yet unclassified' }
Modelo >> infoBibloteca:id [
			
	| bibloteca colInfoDevuelta|
	colBiblotecas  do: [:bibl | |bool| bool :=  (bibl verificarId:id) . bool ifTrue:[bibloteca := bibl]].
	(bibloteca isNil) ifFalse:[colInfoDevuelta := (bibloteca getColInfo)].
	^colInfoDevuelta.
	
]

{ #category : #'as yet unclassified' }
Modelo >> nombre: unNombre direccion: unaDireccion  telefono: unTelefono representante: unRepresentante libros:colLibros [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			|bibl|
	bibl :=  (Biblioteca nombre: unNombre direccion: unaDireccion  telefono: unTelefono representante: unRepresentante libros:colLibros).
	colBiblotecas add: bibl.
	Biblioteca changed.
]

{ #category : #'as yet unclassified' }
Modelo >> recolectarPrestamos: usuario [

	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| prestamosRetornar |
	colBiblotecas do: [ :biblioteca | 
		| prestamosDeBiblitoteca |
		prestamosDeBiblitoteca := biblioteca devolverPrestamosDeUsuario:
			                          usuario.
		prestamosDeBiblitoteca isNil ifFalse: [ 
			prestamosDeBiblitoteca do: [ :prestamo | 
				prestamosRetornar add: prestamo ] ] ].
	^ prestamosRetornar
]

{ #category : #'as yet unclassified' }
Modelo >> registrarPrestamo: dniUsuario colLibros: colLibros idBibloteca: idBibloteca [

	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| retornar bibloteca usuario cantLibros indxLibros librosTipoAudio |
	Transcript show: 'Entro en registrar prestamo , modelo'.
	librosTipoAudio := OrderedCollection new.
	colBiblotecas do: [ :bibl | "Busco la bibloteca"
		| bool |
		bool := bibl verificarId: idBibloteca.
		bool ifTrue: [ bibloteca := bibl ] ].

	colUsuarios do: [ :us | "busco el usuario"
		| bool |
		bool := us verificarDni: dniUsuario.
		bool ifTrue: [ usuario := us ] ].

	indxLibros := 1.
	cantLibros := colLibros size.
	indxLibros to: cantLibros do: [ :i | "Recolecto los libros tipo audio"
		| libro |
		libro := colLibros at: i.
		libro getTipo = 'audio' ifTrue: [ 
			librosTipoAudio add: libro.
			colLibros removeAt: i ] ].
	(bibloteca isNil or: usuario isNil)
		ifTrue: [ "Bibloteca o usuario no encontrado" retornar := -1 ];
		ifFalse: ["Encontro usuario y bibloteca"
			(bibloteca usuarioPrestamosMaximos: usuario) ifFalse: [ 
					(((bibloteca usuarioTienePrestamo: usuario) and:
							  colLibros isEmpty not) or:
							 ((bibloteca usuarioTienePrestamoAudio: usuario) and:
									  librosTipoAudio isEmpty not)) ifFalse: [ "Entra siempre q el usuario tenga espacio para su prestamo , si ya tiene un prestamo normal no puede pedir otro normal , pero si tiene uno normal y pide uno tipo audio puede "
							(librosTipoAudio isEmpty not and: usuario esPlus not)
								ifTrue: [ "El usuario no es plus y quiere pedir prestamo de audiolibro" 
									retornar := -2 ];
								ifFalse: [ "entra cuando es plus o cuando no quiere audiolibro"
									| prestamo |
									retornar := 1. "Funciono el metodo"
									colLibros isEmpty ifFalse: [ 
											prestamo := Prestamo
												            crearPrestamo: colLibros
												            usuario: usuario.
											bibloteca registrarPrestamo: prestamo ].
									librosTipoAudio isEmpty ifFalse: [ "Si el usuario pidio audiolibros hace otro prestamo"
											| prestamoAudio |
											prestamoAudio := Prestamo
												                 crearPrestamo: librosTipoAudio
												                 usuario: usuario.
											bibloteca registrarPrestamo: prestamoAudio ] ] ] ].Transcript show: 'CHANGED'. Usuario changed.].

	^ retornar
]

{ #category : #'as yet unclassified' }
Modelo >> registrarUsuario: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena plus:unPlus [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|existeUsuario|
	existeUsuario := colUsuarios anySatisfy: [:u | u verificarDni: unDni].
	existeUsuario ifFalse: [colUsuarios add: (Usuario nuevoNombre: unNombre  apellido: unApellido   dni: unDni   contrasena: unaContrasena plus:unPlus)].
	
	^existeUsuario not.
]
