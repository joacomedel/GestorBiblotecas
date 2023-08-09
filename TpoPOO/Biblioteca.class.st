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
			
	
]
