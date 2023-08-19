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
Modelo >> alternarModalidad:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|usuario |
	usuario := self buscarColUsuario: dni contraseña: contraseña.
	usuario alternarModalidad.
	
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
	Transcript show: id.
	(bibloteca isNil) ifFalse:[libroARetornar := (bibloteca buscarLibro: nombreLibro)].
	Transcript show: libroARetornar.
	^libroARetornar.
	
]

{ #category : #'as yet unclassified' }
Modelo >> buscarUsuario:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
		|usuario colDatos |
	usuario := self buscarColUsuario: dni contraseña: contraseña.
	colDatos := OrderedCollection new.
	usuario = nil ifFalse:[colDatos := usuario recopilarDatos ].
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
]

{ #category : #'as yet unclassified' }
Modelo >> registrarPrestamo:dniUsuario colLibros: colLibros idBibloteca: idBibloteca [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			|retornar bibloteca usuario cantLibros indxLibros librosTipoAudio|
	librosTipoAudio := OrderedCollection new.
	colBiblotecas  do: [:bibl | |bool| bool :=  (bibl verificarId:idBibloteca) . bool ifTrue:[bibloteca := bibl]].
	colUsuarios  do:[:us| |bool| bool := (us verificarDni:dniUsuario).bool ifTrue:[usuario := us]].
	indxLibros := 1.
	cantLibros := colLibros size.
	indxLibros to: cantLibros do:[:i|
		|libro|
		libro := colLibros at:i.
		libro getTipo = 'audio' ifTrue:[
			librosTipoAudio add: libro.
			colLibros removeAt:i.
			].
		].
	((librosTipoAudio isEmpty) not and: ((usuario esPlus) not)) ifTrue:[
		"El usuario no es plus y quiere pedir prestamo de audiolibro" retornar := -2.
		];
		ifFalse:[
			|prestamo|
			prestamo := Prestamo crearPrestamo:colLibros usuario: usuario.
			bibloteca registrarPrestamo: prestamo.
			((librosTipoAudio isEmpty) not)  ifTrue:[
				|prestamoAudio|
				prestamoAudio := Prestamo crearPrestamo:librosTipoAudio  usuario:usuario. 
				bibloteca registrarPrestamo:prestamoAudio.
				]
		]
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
