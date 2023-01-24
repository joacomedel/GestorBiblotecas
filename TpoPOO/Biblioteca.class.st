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
	#category : #'TpoPOO-Modelo'
}

{ #category : #'as yet unclassified' }
Biblioteca class >> nuevoIdentificador: unIdentificador direccion: unaDireccion nombre: unNombre telefono: unTelefono representante: unRepresentante [
    ^ self new inicializarIdentificador: unIdentificador direccion: unaDireccion nombre: unNombre telefono: unTelefono representante: unRepresentante
]

{ #category : #'as yet unclassified' }
Biblioteca >> Identificador: unIdentificador direccion: unaDireccion nombre: unNombre telefono: unTelefono representante: unRepresentante [
    identificador := unIdentificador.
    direccion := unaDireccion.
    nombre := unNombre.
    telefonoRepresentante := unTelefono.
    nombreRepresentate  := unRepresentante.
    libros := OrderedCollection new.
    prestamos := OrderedCollection new.
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
