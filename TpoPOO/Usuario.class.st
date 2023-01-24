Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'apellido',
		'dni',
		'contrasena',
		'colBibliotecasInteres',
		'plus'
	],
	#category : #'TpoPOO-Modelo'
}

{ #category : #'as yet unclassified' }
Usuario class >> nuevoNombre: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena plus: unPlus [
     ^ self new inicializarNombre: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena plus:unPlus.
]

{ #category : #'as yet unclassified' }
Usuario >> agregarBibliotecaDeInteres: unaBiblioteca [
	colBibliotecasInteres add: unaBiblioteca
]

{ #category : #'as yet unclassified' }
Usuario >> inicializarNombre: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena plus:unPlus [
    nombre := unNombre.
    apellido := unApellido.
    dni := unDni.
    contrasena := unaContrasena.
	plus := unPlus.
    colBibliotecasInteres  := OrderedCollection new.
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

{ #category : #'as yet unclassified' }
Usuario >> verificarDni:unDni [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^dni = unDni.
]
