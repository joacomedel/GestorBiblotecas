Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'apellido',
		'dni',
		'contrasena',
		'colBibliotecasInteres'
	],
	#category : #'TpoPOO-Modelo'
}

{ #category : #'as yet unclassified' }
Usuario class >> nuevoNombre: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena [
    ^ self new inicializarNombre: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena.
]

{ #category : #'as yet unclassified' }
Usuario >> agregarBibliotecaDeInteres: unaBiblioteca [
	colBibliotecasInteres add: unaBiblioteca
]

{ #category : #'as yet unclassified' }
Usuario >> inicializarNombre: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena [
    nombre := unNombre.
    apellido := unApellido.
    dni := unDni.
    contrasena := unaContrasena.
    colBibliotecasInteres  := Set new.
]

{ #category : #'as yet unclassified' }
Usuario >> solicitarPrestamoLibro: unLibro deBiblioteca: unaBiblioteca [
	|prestamo|
	prestamo := Prestamo new.
	prestamo biblioteca: unaBiblioteca.
	prestamo usuario: self.
	prestamo fechaPrestamo: Date today.
	prestamo agregarLibro: unLibro.
	unaBiblioteca agregarPrestamo: prestamo.
]
