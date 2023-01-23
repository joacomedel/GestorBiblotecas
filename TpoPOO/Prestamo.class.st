Class {
	#name : #Prestamo,
	#superclass : #Object,
	#instVars : [
		'biblioteca',
		'usuario',
		'fechaPrestamo',
		'fechaEntrega',
		'libros',
		'fechaDevolucion'
	],
	#category : #'TpoPOO-Modelo'
}

{ #category : #'as yet unclassified' }
Prestamo class >> nuevoBiblioteca: unaBiblioteca usuario: unUsuario fechaPrestamo: unaFechaPrestamo [
^ self new inicializarBiblioteca: unaBiblioteca usuario: unUsuario fechaPrestamo: unaFechaPrestamo
]

{ #category : #accessing }
Prestamo >> agregarLibro: unLibro [
	libros add: unLibro
]

{ #category : #accessing }
Prestamo >> biblioteca: unaBiblioteca [
	biblioteca := unaBiblioteca

]

{ #category : #accessing }
Prestamo >> fechaEntrega: unaFecha [
	fechaEntrega := unaFecha
]

{ #category : #accessing }
Prestamo >> fechaPrestamo: unaFecha [
	fechaPrestamo := unaFecha
]

{ #category : #'as yet unclassified' }
Prestamo >> inicializarBiblioteca: unaBiblioteca usuario: unUsuario fechaPrestamo: unaFechaPrestamo [
biblioteca := unaBiblioteca.
usuario := unUsuario.
fechaPrestamo := unaFechaPrestamo.
fechaDevolucion := nil.
]

{ #category : #accessing }
Prestamo >> usuario: unUsuario [
	usuario := unUsuario
]
