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
Modelo >> agregarBibliotecaDeInteres:idBiblioteca usuario:dniUsuario [
			|biblioteca usuario|
	colBiblotecas do: [:bibl | |bool| bool :=  (bibl verificarId:idBiblioteca) . bool ifTrue:[biblioteca := bibl]].
	colUsuarios do:[:us | |bool| bool :=  (us verificarDni:dniUsuario).bool ifTrue:[usuario := us]].
	(biblioteca isNotNil and: usuario isNotNil) ifTrue:[usuario agregarBibliotecaDeInteres:biblioteca].
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
	(bibloteca isNil) ifFalse:[libroARetornar := (bibloteca buscarLibro: nombreLibro).Transcript show: 'ENCONTRO LIBRO'.].
	^libroARetornar.
	
]

{ #category : #'as yet unclassified' }
Modelo >> buscarUsuario:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
		|usuario colDatos datosPrestamo prestamos|
		datosPrestamo := OrderedCollection new.
	usuario := self buscarColUsuario: dni contraseña: contraseña.
	colDatos := OrderedCollection new.
	usuario = nil ifFalse:[colDatos := usuario recopilarDatos . prestamos := self recolectarPrestamos:usuario.prestamos isEmpty ifFalse: [prestamos do:[:prestamo | datosPrestamo add: prestamo getInfoPrestamo].
		colDatos add: datosPrestamo. "Agrego la coleccion con datos de sus prestamos "]].
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
Modelo >> devolverPrestamo:inxPrestamo dniUsuario:dniUsuario [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|usuario|
	colUsuarios do:[:us | |bool| bool := us verificarDni: dniUsuario . bool ifTrue:[usuario := us.]].
	usuario isNotNil ifTrue:[].
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
	prestamosRetornar := OrderedCollection new.
	colBiblotecas do: [ :biblioteca | 
		| prestamosDeBiblitoteca |
		prestamosDeBiblitoteca := biblioteca buscarPrestamosDeUsuario:
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

	|retornar  usuario|


	colUsuarios do: [ :us | "busco el usuario"
		| bool |
		bool := us verificarDni: dniUsuario.
		bool ifTrue: [ usuario := us ] ].
	usuario isNotNil ifTrue: [ retornar :=  usuario registarPrestamo:colLibros  idBibloteca: idBibloteca.Usuario changed.];ifFalse:[retornar := -1].
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
