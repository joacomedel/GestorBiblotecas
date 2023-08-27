Class {
	#name : #Biblioteca,
	#superclass : #Object,
	#instVars : [
		'identificador',
		'direccion',
		'nombre',
		'telefonoRepresentante',
		'nombreRepresentate',
		'libros',
		'prestamos'
	],
	#classInstVars : [
		'cantBibl'
	],
	#category : #'TpoPOO-Modelo'
}

{ #category : #'as yet unclassified' }
Biblioteca class >> getCantBiblotecas [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	^cantBibl.
]

{ #category : #'as yet unclassified' }
Biblioteca class >> iniciarVariablesDeClase [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	cantBibl := 0.
]

{ #category : #'as yet unclassified' }
Biblioteca class >> nombre: unNombre direccion: unaDireccion  telefono: unTelefono representante: unRepresentante libros:colLibros [.
	 cantBibl := cantBibl + 1.
    ^ self new nombre: unNombre direccion: unaDireccion  telefono: unTelefono representante: unRepresentante libros:colLibros.
]

{ #category : #'as yet unclassified' }
Biblioteca >> agregarLibro: unLibro [
	libros add: unLibro
]

{ #category : #'as yet unclassified' }
Biblioteca >> agregarPrestamo: unPrestamo [
	prestamos add: unPrestamo
]

{ #category : #'as yet unclassified' }
Biblioteca >> buscarLibro:nombreLibro [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|libroRetornar|
	libros do:[:libro | |bool| bool := (libro verificarNombre:nombreLibro). bool ifTrue:[libroRetornar := libro]].
	^libroRetornar.
]

{ #category : #'as yet unclassified' }
Biblioteca >> devolverNombreId [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^ (nombre , ' ',(identificador asString))
]

{ #category : #'as yet unclassified' }
Biblioteca >> devolverPrestamosDeUsuario:usuario [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|prestamosRetornar|
	prestamosRetornar := OrderedCollection new.
	Transcript show: ' ENTRA EN DEOLVERPRESTAMOSDEUSUARIO  '.
	prestamos do: [:prestamo | |bool| bool := (prestamo verificarUsuario: usuario).bool ifTrue:[prestamosRetornar add: prestamo . Transcript show: ' ENCONTRO PRESTAMO COMO USUARIO ']].
	^prestamosRetornar.
]

{ #category : #'as yet unclassified' }
Biblioteca >> getColInfo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|colRetornar colLibros colPrestamos|
	colRetornar := OrderedCollection new.
	colLibros := OrderedCollection new.
	colPrestamos := OrderedCollection new.
	
	libros do:[:libr | colLibros add: (libr getInfo)]. "Sacamos la informacion de un libro y lo añadimos a una coleccion q vamos a retornar en la coleccionRetornar final "
	prestamos do:[:prestamo | colPrestamos add: (prestamo getInfoPrestamo)]."Sacamos la informacion de un prestamo y lo añadimos a una coleccion q vamos a retornar en la coleccionRetornar final "
	colRetornar add: (identificador clone);add: (direccion clone);add: (nombre clone) ;add: (telefonoRepresentante clone);add: (nombreRepresentate clone);add: (colLibros);add: (colPrestamos).
	^colRetornar.
]

{ #category : #'as yet unclassified' }
Biblioteca >> librosEnDeuda [
	prestamos select: [:prestamo | prestamo fechaEntrega isNil]
]

{ #category : #'as yet unclassified' }
Biblioteca >> nombre: unNombre direccion: unaDireccion  telefono: unTelefono representante: unRepresentante libros:colLibros [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
		||
		identificador := self class getCantBiblotecas.
		nombre := unNombre.
		direccion := unaDireccion.
		telefonoRepresentante := unTelefono.
		nombreRepresentate := unRepresentante.
		libros := colLibros.
		prestamos := OrderedCollection new.
			
	
]

{ #category : #'as yet unclassified' }
Biblioteca >> registrarPrestamo:prestamo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	Transcript show:'Registro el prestamo'.
	prestamos add:prestamo.
]

{ #category : #'as yet unclassified' }
Biblioteca >> usuarioPrestamosMaximos: usuario [
	| retornar tienePrestamoAudio tienePrestamo|
	"MetodoLlamadoPorUsuarioPlus"
	retornar := false.
	tienePrestamoAudio := self usuarioTienePrestamoAudio: usuario.
	tienePrestamo := self usuarioTienePrestamo: usuario.
	(tienePrestamoAudio and: tienePrestamo) ifTrue:[retornar = true.].
	^ retornar
]

{ #category : #'as yet unclassified' }
Biblioteca >> usuarioTienePrestamo:usuario [
"Metodo q devuelve true si tiene prestamo , ignorando los prestamos tipo audio"

			|tienePrestamo|
			tienePrestamo := false.
			prestamos do: [ :prestamo | 
					| esAudio esUsuario |
					esAudio := prestamo verificarPrestamoAudio.
					esUsuario := prestamo verificarUsuario: usuario.
					(esAudio not and: esUsuario) ifTrue:[tienePrestamo := true] ].
			^tienePrestamo.
]

{ #category : #'as yet unclassified' }
Biblioteca >> usuarioTienePrestamoAudio:usuario [


			|tienePrestamoAudio|
			tienePrestamoAudio:= false.
			
			prestamos do: [:prestamo  | |esAudio esUsuario| esAudio := prestamo verificarPrestamoAudio. esUsuario := prestamo verificarUsuario: usuario. (esAudio and:esUsuario) ifTrue:[tienePrestamoAudio := true]].
			^tienePrestamoAudio.
]

{ #category : #'as yet unclassified' }
Biblioteca >> verificarId:id [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	
	^(identificador = id).
]
