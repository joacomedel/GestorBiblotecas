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
Modelo >> incializar:controladorIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	controlador:= controladorIn.
	colAutores := OrderedCollection new.
	colBiblotecas := OrderedCollection new.
	colUsuarios := OrderedCollection new.
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
