Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'apellido',
		'dni',
		'contraseña',
		'colBibliotecasInteres',
		'plus'
	],
	#category : #'TpoPOO-Modelo'
}

{ #category : #'as yet unclassified' }
Usuario class >> nuevoNombre: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena plus: unPlus [
     ^ self new inicializarNombre: unNombre apellido: unApellido dni: unDni contraseña: unaContrasena plus:unPlus.
]

{ #category : #'as yet unclassified' }
Usuario >> agregarBibliotecaDeInteres: unaBiblioteca [
	colBibliotecasInteres add: unaBiblioteca
]

{ #category : #'as yet unclassified' }
Usuario >> alternarModalidad [ 
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	plus := plus not.
]

{ #category : #'as yet unclassified' }
Usuario >> getDni [.
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^dni clone.
]

{ #category : #'as yet unclassified' }
Usuario >> inicializarNombre: unNombre apellido: unApellido dni: unDni contraseña: unaContrasena plus:unPlus [
   nombre := unNombre.
   apellido := unApellido.
   dni := unDni.
   contraseña := unaContrasena.
	plus := unPlus.
   	colBibliotecasInteres  := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Usuario >> recopilarDatos [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| colDatos stringPlus|
	colDatos := OrderedCollection new.
	colDatos add:nombre asString.
	colDatos add:apellido asString.
	colDatos add:dni asString.
	plus ifTrue:[stringPlus := 'activado'] ifFalse:[stringPlus := 'desactivado'].
	colDatos add: stringPlus.
	Transcript show: 'Recopila datos'.
	^colDatos.
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
Usuario >> verificarDni: dniIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^ dni = dniIn.
]

{ #category : #'as yet unclassified' }
Usuario >> verificarUsuario:dniIn contraseña: contraseñaIn [
	
	|bool|
	bool := ((dniIn=dni) & (contraseñaIn = contraseña)).
	Transcript show: bool.
	^ bool.
]
