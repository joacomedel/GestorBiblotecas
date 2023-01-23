Class {
	#name : #Ventana,
	#superclass : #SystemWindow,
	#instVars : [
		'interfaz',
		'colInterfaces'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
Ventana >> cambiarInterfaz:nombre [.
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	interfaz delete.
	self ponerInterfaz: nombre.
]

{ #category : #'as yet unclassified' }
Ventana >> iniciarInterfaces [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	colInterfaces add: (Menu crear:self). 
	colInterfaces add: (AgregarBibloteca crear:self).
	colInterfaces add: (CambiarModalidad  crear:self).
	colInterfaces add: (ActualizarBibloteca crear:self).
	colInterfaces add: (InformacionBibloteca  crear:self).
	colInterfaces add: (InformacionUsuario  crear:self).
	colInterfaces add: (RegistrarUsuario  crear:self).
	colInterfaces add: (SolicitarPrestamo crear:self).
]

{ #category : #'as yet unclassified' }
Ventana >> iniciarVentana [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	
	colInterfaces := OrderedCollection new.
	self iniciarInterfaces.
	self setLabel:'TPoPOO'.
	self extent: 480@854.
	self ponerInterfaz:'Menu'.
]

{ #category : #'window management' }
Ventana >> maximize [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^nil
]

{ #category : #'as yet unclassified' }
Ventana >> ponerInterfaz:nombre [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	
	interfaz := colInterfaces detect:[:i |i comprobarNombre: nombre] .
	self addMorphCentered:interfaz.
	
]
