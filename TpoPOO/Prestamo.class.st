Class {
	#name : #Prestamo,
	#superclass : #Object,
	#instVars : [
		'fechaInicioPrestamo',
		'usuario',
		'fechaFinPrestamo',
		'libros',
		'fechaUsuarioDevuele',
		'idPrestamo'
	],
	#classInstVars : [
		'cantPrestamos'
	],
	#category : #'TpoPOO-Modelo'
}

{ #category : #'as yet unclassified' }
Prestamo class >> crearPrestamo:colLibros usuario:usuarioIn [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
	cantPrestamos := cantPrestamos +1.
	^self new iniciarPrestamo:colLibros usuario: usuarioIn. 
]

{ #category : #'as yet unclassified' }
Prestamo class >> getCantPrestamos [
	^cantPrestamos.
]

{ #category : #'as yet unclassified' }
Prestamo class >> iniciarVariablesDeClase [ 
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	cantPrestamos := 0.
]

{ #category : #'as yet unclassified' }
Prestamo >> agregarMulta [.
	"scope: class-variables  &  instance-variables"	
			
	self estaAtrasado  ifTrue:[usuario agregarDiasMulta:1].
]

{ #category : #'as yet unclassified' }
Prestamo >> devolver [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	Transcript show: ' PRESTAMO DEVUELTO '.
	fechaUsuarioDevuele := Date today.
	
]

{ #category : #'as yet unclassified' }
Prestamo >> estaAtrasado [.
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^fechaFinPrestamo < Date today.
]

{ #category : #'as yet unclassified' }
Prestamo >> getInfoPrestamo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
		|nombresLibro|
		nombresLibro := ''.
		libros do:[:libro |nombresLibro := nombresLibro , (libro getNombre) , ' '].
	^ 'dni: ', (usuario getDni) asString ,'idPrestamo: ' , idPrestamo asString , ' ' , 'libros: ' ,nombresLibro. 
	
]

{ #category : #'as yet unclassified' }
Prestamo >> getUsuario [.
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^usuario
]

{ #category : #'as yet unclassified' }
Prestamo >> iniciarPrestamo:colLibros usuario:usuarioIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
		libros := colLibros.
		usuario := usuarioIn.
		fechaInicioPrestamo := Date today.
		fechaFinPrestamo := Date today + 30.
		idPrestamo := self class getCantPrestamos.
		
	
]

{ #category : #accessing }
Prestamo >> usuario: unUsuario [
	usuario := unUsuario
]

{ #category : #'as yet unclassified' }
Prestamo >> verificarPrestamoAudio [.
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^ (libros at:1)getTipo = 'audio'.
]

{ #category : #'as yet unclassified' }
Prestamo >> verificarUsuario:usuarioIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^usuario = usuarioIn and: fechaUsuarioDevuele isNil.
]
