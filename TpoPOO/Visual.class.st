Class {
	#name : #Visual,
	#superclass : #Object,
	#instVars : [
		'controlador',
		'ventana'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'instance creation' }
Visual class >> newVisual:controladorIn [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	|temp|
	temp := self new.
	temp incializar:controladorIn.
	^temp.
]

{ #category : #'as yet unclassified' }
Visual >> alternarModalidad:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	controlador alternarModalidad:dni contraseña:contraseña.
]

{ #category : #'as yet unclassified' }
Visual >> buscarUsuario:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	^ controlador buscarUsuario:dni contraseña:contraseña.
]

{ #category : #'as yet unclassified' }
Visual >> incializar:controladorIn [.
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	controlador := controladorIn.
	ventana := Ventana crear:self.
	ventana openInWorld.
	
]

{ #category : #'as yet unclassified' }
Visual >> registrarUsuario: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena plus:unPlus [

	|registro|
	
	registro := controlador  registrarUsuario: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena plus:unPlus.
	^registro
]
