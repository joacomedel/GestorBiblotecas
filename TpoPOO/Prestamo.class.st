Class {
	#name : #Prestamo,
	#superclass : #Object,
	#instVars : [
		'fechaPrestamo',
		'usuario',
		'fechaEntrega',
		'libros',
		'fechaDevolucion'
	],
	#category : #'TpoPOO-Modelo'
}

{ #category : #'as yet unclassified' }
Prestamo class >> crearPrestamo:colLibros usuario:usuarioIn [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	^self new iniciarPrestamo:colLibros usuario: usuarioIn. 
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
Prestamo >> getInfoPrestamo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
		|nombresLibro|
		nombresLibro := ''.
		libros do:[:libro |nombresLibro := nombresLibro , (libro getNombre) , ' '].
	^ (usuario getDni) asString , ' ' , nombresLibro. 
	
]

{ #category : #'as yet unclassified' }
Prestamo >> iniciarPrestamo:colLibros usuario:usuarioIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	
]

{ #category : #accessing }
Prestamo >> usuario: unUsuario [
	usuario := unUsuario
]
