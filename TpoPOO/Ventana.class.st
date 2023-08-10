Class {
	#name : #Ventana,
	#superclass : #SystemWindow,
	#instVars : [
		'interfaz',
		'colInterfaces',
		'visual'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
Ventana class >> crear:visualIn [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	^self new iniciar:visualIn.
]

{ #category : #'as yet unclassified' }
Ventana >> alternarModalidad:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	visual alternarModalidad:dni contraseña:contraseña.
]

{ #category : #'as yet unclassified' }
Ventana >> buscarUsuario:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	^ visual buscarUsuario:dni contraseña:contraseña.
	
]

{ #category : #'as yet unclassified' }
Ventana >> cambiarInterfaz:nombre [.
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	interfaz delete.
	self ponerInterfaz: nombre.
]

{ #category : #'as yet unclassified' }
Ventana >> crearLibro:nombreIn editorial:editorialIn anioEdicion:anioEdicion  autores:autoresIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|libro|
	libro := visual crearLibro:nombreIn  editorial: editorialIn anioEdicion: anioEdicion autores: autoresIn.
	^libro.
]

{ #category : #'as yet unclassified' }
Ventana >> devolverBiblotecasInfo [ 
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^ visual devolverBiblotecasInfo.
]

{ #category : #'as yet unclassified' }
Ventana >> iniciar:visualIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	visual := visualIn.
	colInterfaces := OrderedCollection new.
	self iniciarInterfaces.
	self setLabel:'TPoPOO'.
	self extent: 480@854.
	self ponerInterfaz:'Menu'.
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

{ #category : #'window management' }
Ventana >> maximize [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^nil
]

{ #category : #'as yet unclassified' }
Ventana >> nombre: unNombre direccion: unaDireccion  telefono: unTelefono representante: unRepresentante libros:colLibros [	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	"crea bibloteca"		
	^ visual nombre: unNombre direccion: unaDireccion  telefono: unTelefono representante: unRepresentante libros:colLibros.
]

{ #category : #'as yet unclassified' }
Ventana >> ponerInterfaz:nombre [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	
	interfaz := colInterfaces detect:[:i |i comprobarNombre: nombre] .
	self addMorphCentered:interfaz.
	
]

{ #category : #'as yet unclassified' }
Ventana >> registrarUsuario: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena plus:unPlus [

	|registro|
	
	registro := visual registrarUsuario: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena plus:unPlus.
	^registro
]
